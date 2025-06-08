{ ... }:
{
  wayland.windowManager.hyprland.settings.decoration = {
    rounding = 10;

    active_opacity = 1.0;
    inactive_opacity = 0.9;
    fullscreen_opacity = 1.0;

    dim_inactive = true;
    dim_strength = 0.1;
    dim_special = 0.8;

    blur = {
      enabled = true;
      size = 4;
      passes = 2;
      noise = 0;
      ignore_opacity = true;
      new_optimizations = true;
      special = true;
    };

    shadow = {
      enabled = true;
      range = 1;
      render_power = 1;

      color = "$color12";
      color_inactive = "$color10";
    };
  };
}
