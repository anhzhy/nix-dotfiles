{ desktop, ... }:
{
  services.xserver.displayManager = {
    lightdm = {
      enable = true;
    };
  };
  services.displayManager.defaultSession = desktop;
}
