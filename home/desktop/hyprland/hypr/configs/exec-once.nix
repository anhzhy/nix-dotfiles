{ ... }:
{
  wayland.windowManager.hyprland.settings.exec-once = [
    "dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
    "systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
    "systemctl --user restart xdg-desktop-portal xdg-desktop-portal-gtk xdg-desktop-portal-hyprland"

    "pkill fcitx5 &"
    "systemctl --user restart fcitx5-daemon"

    "swww-daemon --format xrgb"
    ''mpvpaper '*' -o "load-scripts=no no-audio --loop" $LIVE_WALLPAPER''

    "waybar &"
    "nm-applet --indicator &"

    "wl-paste --type text --watch cliphist store"
    "wl-paste --type image --watch cliphist store"

    "hypridle &"
    "vesktop &"
  ];
}
