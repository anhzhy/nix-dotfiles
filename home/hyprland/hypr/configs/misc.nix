{ ... }:
{
  wayland.windowManager.hyprland.settings.misc = {
    disable_hyprland_logo = true;
    disable_splash_rendering = true;
    vfr = true;
    vrr = 2;
    mouse_move_enables_dpms = true;
    enable_swallow = true;
    swallow_regex = "^(kitty)$";
    focus_on_activate = false;
    initial_workspace_tracking = 0;
    middle_click_paste = false;
  };
}
