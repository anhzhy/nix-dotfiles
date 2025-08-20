#!/bin/bash

# WALLPAPERS PATH
WALLPAPER_DIR="$HOME/Pictures/wallpapers"
WALLPAPER_SCRIPTS="$HOME/.config/hypr/scripts"
WALLPAPER_CURRENT="$HOME/.config/hypr/wallpaper_effects/.wallpaper_current"

# CACHE PATH
IMAGE_CACHE="$HOME/.cache/wallpapers/image"
VIDEO_CACHE="$HOME/.cache/wallpapers/video"
GIF_CACHE="$HOME/.cache/wallpapers/gif"

# SWWW CONFIG
FPS=60
TYPE="any"
DURATION=2
BEZIER=".43,1.19,1,.4"
SWWW_PARAMS="--transition-fps $FPS --transition-type $TYPE --transition-duration $DURATION --transition-bezier $BEZIER"

# ROFI CONFIG
ROFI_CONFIG="$HOME/.config/rofi/config-wallpaper.rasi"
ROFI_COMMAND="rofi -i -show -dmenu -config $ROFI_CONFIG"

if ! command -v bc &>/dev/null; then
  exit 1
fi

[ -d "$IMAGE_CACHE" ] || mkdir -p "$IMAGE_CACHE"
[ -d "$VIDEO_CACHE" ] || mkdir -p "$VIDEO_CACHE"
[ -d "$GIF_CACHE" ] || mkdir -p "$GIF_CACHE"

focused_monitor=$(hyprctl monitors -j | jq -r '.[] | select(.focused) | .name')
if [[ -z "$focused_monitor" ]]; then
  exit 1
fi

# Monitor details
scale_factor=$(hyprctl monitors -j | jq -r --arg mon "$focused_monitor" '.[] | select(.name == $mon) | .scale')
monitor_height=$(hyprctl monitors -j | jq -r --arg mon "$focused_monitor" '.[] | select(.name == $mon) | .height')

# Kill existing wallpaper daemons for video
kill_wallpaper_for_video() {
  swww kill 2>/dev/null
  pkill mpvpaper 2>/dev/null
  pkill swaybg 2>/dev/null
  pkill hyprpaper 2>/dev/null
}

# Kill existing wallpaper daemons for image
kill_wallpaper_for_image() {
  pkill mpvpaper 2>/dev/null
  pkill swaybg 2>/dev/null
  pkill hyprpaper 2>/dev/null
}

# Cache an image wallpaper
cache_image() {
  local src="$1"
  local dst="$2"
  magick "$src" -resize 600x600^ -gravity center -extent 600x600 "$dst"
}

# Retrieve wallpapers
mapfile -d '' PICS < <(find -L "${WALLPAPER_DIR}" -type f \( \
  -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" -o -iname "*.gif" -o \
  -iname "*.bmp" -o -iname "*.tiff" -o -iname "*.webp" -o \
  -iname "*.mp4" -o -iname "*.mkv" -o -iname "*.mov" -o -iname "*.webm" \) -print0)

# Sorting Wallpapers
menu() {
  IFS=$'\n' sorted_options=($(sort <<<"${PICS[*]}"))

  for pic_path in "${sorted_options[@]}"; do
    pic_name=$(basename "$pic_path")
    filename_no_ext="${pic_name%.*}"

    if [[ "$pic_name" =~ \.gif$ ]]; then
      cache_gif_image="$GIF_CACHE/${pic_name}.png"
      if [[ ! -f "$cache_gif_image" ]]; then
        magick "$pic_path[0]" -resize 600x600 "$cache_gif_image"
      fi
      printf "%s\x00icon\x1f%s\n" "$pic_name" "$cache_gif_image"

    elif [[ "$pic_name" =~ \.(mp4|mkv|mov|webm|MP4|MKV|MOV|WEBM)$ ]]; then
      cache_video_image="$VIDEO_CACHE/${pic_name}.png"
      if [[ ! -f "$cache_video_image" ]]; then
        ffmpeg -v error -y -i "$pic_path" -ss 00:00:01.000 -vframes 1 -vf "scale=600:600:force_original_aspect_ratio=decrease,pad=600:600:(ow-iw)/2:(oh-ih)/2" "$cache_video_image"
      fi
      printf "%s\x00icon\x1f%s\n" "$pic_name" "$cache_video_image"

    else
      cache_img="$IMAGE_CACHE/${filename_no_ext}.png"
      if [[ ! -f "$cache_img" ]]; then
        cache_image "$pic_path" "$cache_img"
      fi
      printf "%s\x00icon\x1f%s\n" "$filename_no_ext" "$cache_img"
    fi
  done
}

modify_startup_config() {
  local selected_file="$1"
  local startup_config="$HOME/.config/hypr/hyprland.conf"

  if [[ "$selected_file" =~ \.(mp4|mkv|mov|webm|MP4|MKV|MOV|WEBM)$ ]]; then
    # For video wallpaper
    sed -i '/^\s*exec-once\s*=\s*swww-daemon\s*--format\s*xrgb\s*$/s/^/#/' "$startup_config"
    sed -i '/^\s*#\s*exec-once\s*=\s*mpvpaper\s*.*$/s/^#\s*//' "$startup_config"

    selected_file="${selected_file/#$HOME/\$HOME}"

    sed -i "s|^\$livewallpaper=.*|\$livewallpaper=\"$selected_file\"|" "$startup_config"

    echo "Configured for live wallpaper (video)."
  else
    # For image wallpaper
    sed -i '/^\s*#\s*exec-once\s*=\s*swww-daemon\s*--format\s*xrgb\s*$/s/^\s*#\s*//' "$startup_config"
    sed -i '/^\s*exec-once\s*=\s*mpvpaper\s*.*$/s/^/#/' "$startup_config"

    echo "Configured for static wallpaper (image)."
  fi
}

# Apply Image Wallpaper
apply_image_wallpaper() {
  local image_path="$1"

  kill_wallpaper_for_image

  if ! pgrep -x "swww-daemon" >/dev/null; then
    echo "Starting swww-daemon..."
    swww-daemon --format xrgb &
  fi

  swww img -o "$focused_monitor" "$image_path" $SWWW_PARAMS

  "$WALLPAPER_SCRIPTS/WallustSwww.sh"
  sleep 2

  "$WALLPAPER_SCRIPTS/Refresh.sh"
  sleep 1
}

# Apply Video Wallpaper
apply_video_wallpaper() {
  local video_path="$1"

  if ! command -v mpvpaper &>/dev/null; then
    return 1
  fi

  kill_wallpaper_for_video
  mpvpaper '*' -o "load-scripts=no no-audio --loop" "$video_path" &
}

# Main function
main() {
  choice=$(menu | $ROFI_COMMAND)
  choice=$(echo "$choice" | xargs)

  if [[ -z "$choice" ]]; then
    echo "No choice selected. Exiting."
    exit 0
  fi

  choice_basename=$(basename "$choice" | sed 's/\(.*\)\.[^.]*$/\1/')
  selected_file=$(find "$WALLPAPER_DIR" -iname "$choice_basename.*" -print -quit)

  if [[ -z "$selected_file" ]]; then
    echo "File not found for choice: $choice"
    exit 1
  fi

  modify_startup_config "$selected_file"

  if [[ "$selected_file" =~ \.(mp4|mkv|mov|webm|MP4|MKV|MOV|WEBM)$ ]]; then
    apply_video_wallpaper "$selected_file"
  else
    apply_image_wallpaper "$selected_file"
  fi
}

# Kill existing rofi instances to avoid duplicates
if pidof rofi >/dev/null; then
  pkill rofi
fi

main
