{ ... }:
{
  wayland.windowManager.hyprland.settings.input = {
    sensitivity = 0;
    numlock_by_default = true;
    left_handed = false;
    follow_mouse = true;
    float_switch_override_focus = false;

    touchpad = {
      disable_while_typing = true;
      natural_scroll = false;
      clickfinger_behavior = false;
      middle_button_emulation = true;
      tap-to-click = true;
      drag_lock = false;
    };

    touchdevice = {
      enabled = true;
    };

    tablet = {
      transform = 0;
      left_handed = 0;
    };
  };
}
