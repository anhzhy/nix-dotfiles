{ ... }:
{
  security.rtkit.enable = true;
  security.polkit.enable = true;
  security.sudo.enable = true;
  security.pam.services.hyprlock = { };
  security.pam.services.sddm = {
    enableGnomeKeyring = true;
    startSession = true;
  };
}
