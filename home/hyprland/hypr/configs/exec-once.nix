{ ... }:
{
  wayland.windowManager.hyprland.settings.exec-once = [
    "swww-daemon --format xrgb"

    "dbus-update-activation-environment --all --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
    "systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"

    "waybar &"
    "nm-applet --indicator &"
    # "blueman-applet &"

    "wl-paste --type text --watch cliphist store"
    "wl-paste --type image --watch cliphist store"

    "hypridle &"
    "fcitx5 &"
    "vesktop &"
  ];
}
