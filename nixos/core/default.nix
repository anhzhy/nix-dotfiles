{ ... }: 
{
  imports = [
    ./boot.nix
    ./console.nix
    ./display-manager.nix
    ./flatpak.nix
    ./fonts.nix
    ./hardware.nix
    ./keyboard-layout.nix
    ./locale.nix
    ./networking.nix
    ./nh.nix
    ./nix-settings.nix
    ./programs.nix
    ./security.nix
    ./service.nix
    ./sound.nix
    ./system.nix
    ./timezone.nix
    ./user.nix
    ./virtualisation.nix
  ];
}
