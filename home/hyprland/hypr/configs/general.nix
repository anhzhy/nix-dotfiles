{ ... }:
{
  wayland.windowManager.hyprland.settings.general = {
    border_size = 1;
    gaps_in = 4;
    gaps_out = 8;
    resize_on_border = true;

    layout = "dwindle";

    "col.active_border" = "$foreground";
    "col.inactive_border" = "$background";
  };
}
