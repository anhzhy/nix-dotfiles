{ ... }:
{
  services = {
    displayManager = {
      sddm = {
        enable = true;
        wayland.enable = true;
      };
      defaultSession = "hyprland";
    };
  };

  security.pam.services.sddm = {
    enableGnomeKeyring = true;
    startSession = true;
  };
}
