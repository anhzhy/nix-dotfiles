#!/usr/bin/env bash

SOURCE="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
HOME=$HOME
USERNAME=$(echo $USER)
ERROR="$(tput setaf 1)[ERROR]$(tput sgr0)"
ACTION="$(tput setaf 6)[ACTION]$(tput sgr0)"
RESET="$(tput sgr0)"

# Overwrite username variable in flake.nix
sed -i 's/username\s*=\s*"\([^"]*\)"/username = "'"$USERNAME"'"/' ./flake.nix 

# Detect device type
if [ -r /sys/class/dmi/id/chassis_type ]; then
  case $(cat /sys/class/dmi/id/chassis_type) in
    8|9|10|11)  DEVICE="laptop" ;;
    3|4)        DEVICE="desktop" ;;
    *)          DEVICE="default" ;;
  esac
fi

# Copy config based on your device
read -rp "$ACTION Enter Your New Hostname: " HOSTNAME
if [ -z "$HOSTNAME" ]; then
  echo -e "${ERROR} You Need To Enter Your Hostname${RESET}" >&2
  exit 1
else
  mkdir -p "$SOURCE"/hosts/"$HOSTNAME"
  cp "$SOURCE"/hosts/"$DEVICE"/*.nix "$SOURCE"/hosts/"$HOSTNAME"
  sudo nixos-generate-config --show-hardware-config > "$SOURCE/hosts/$HOSTNAME/hardware-configuration.nix" 2>/dev/null
  sed -i 's/hostname\s*=\s*"\([^"]*\)"/hostname = "'"$HOSTNAME"'"/' ./flake.nix
  git add .
fi

# Copy wallpapers to $HOME
WALLPAPER_SOURCE="$SOURCE/wallpapers"
WALLPAPER_HOME="$HOME/Pictures/wallpapers"

mkdir -p "$WALLPAPER_HOME"

if [ -d "$WALLPAPER_HOME" ]; then
  find "$WALLPAPER_SOURCE" -maxdepth 1 -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" -o \) -exec cp -n {} "$WALLPAPER_HOME" \;
fi

# Build NixOS flake
sudo nixos-rebuild switch --flake $SOURCE/#"${HOSTNAME}"
