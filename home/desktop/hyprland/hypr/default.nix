{ pkgs, ... }:
{
  imports = [ ./configs ];

  systemd.user.targets.hyprland-session.Unit.Wants = [
    "xdg-desktop-autostart.target"
  ];

  xdg.configFile."hypr/scripts".source = ./scripts;

  wayland.windowManager.hyprland = {
    enable = true;
    # enableNvidiaPatches = true;
    systemd.enable = true;

    settings = {
      "source" = "$HOME/.config/hypr/wallust.conf";
      "$TOUCHPAD_DEVICE" = "dell0918:00-0488:121f-touchpad";
      "$TOUCHPAD_ENABLED" = true;

      dwindle = {
        pseudotile = "yes";
        preserve_split = "yes";
        special_scale_factor = 0.8;
      };

      master = {
        new_status = "master";
        new_on_top = 1;
        mfact = 0.5;
      };

      render = {
        # explicit_sync = 2;
        # explicit_sync_kms = 2;
        direct_scanout = 2;
      };

      cursor = {
        sync_gsettings_theme = true;
        no_hardware_cursors = 2;
        enable_hyprcursor = true;
        warp_on_change_workspace = 2;
        no_warps = true;
      };

      xwayland = {
        enabled = true;
        force_zero_scaling = true;
      };

      device = {
        name = "$TOUCHPAD_DEVICE";
        enabled = "$TOUCHPAD_ENABLED";
      };
    };
  };

  home.packages = with pkgs; [
    swww
    grim
    hypr
    slurp
    direnv
    wayland
    cliphist
    hyprpicker
    wf-recorder
    wl-clip-persist
    swaynotificationcenter
  ];
}
