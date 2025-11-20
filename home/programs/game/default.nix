{ pkgs, ... }:
{
  home.packages = with pkgs; [
    nethack
    tetrio-desktop
  ];
}
