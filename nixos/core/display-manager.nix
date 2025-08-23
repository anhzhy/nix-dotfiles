{ ... }:
{
  services.xserver.displayManager = {
    lightdm = {
      enable = true;
    };
  };
  services.displayManager.defaultSession = "hyprland";
}
