{ config, pkgs, inputs, ... }:

{
  imports = [
    inputs.hyprland.nixosModules.default
  ];

  programs.hyprland = {
    enable = true;
    # package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
    # portalPackage = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
    # xwayland.enable = true;
  };

  programs.steam = {
    enable = false;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = false;
    gamescopeSession.enable = true;
    extraCompatPackages = [ pkgs.proton-ge-bin ];
  };

  programs.zsh.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  # xdg.portal = {
  #   enable = true;
  #   # xdgOpenUsePortal = true;
  #   config = {
  #     common.default = [ "gtk" ];
  #     hyprland.default = [
  #       "gtk"
  #       "hyprland"
  #     ];
  #   };
  #   # wlr.enable = true;
  #   extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  # };
  
  programs.dconf.enable = true;
  programs.nix-ld.enable = true;
  # programs.nix-ld.libraries = with pkgs; [ ];
}
