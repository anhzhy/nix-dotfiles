{ inputs, pkgs, ... }:
{
  home.packages = with pkgs; [
    inputs.nix-gaming.packages.${system}.osu-stable
    nethack
    tetrio-desktop
  ];
}
