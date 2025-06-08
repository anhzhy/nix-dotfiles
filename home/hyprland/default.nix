{ inputs, ... }:
{
  imports = [
    inputs.hyprland.homeManagerModules.default
    ./hypr
    ./rofi
    ./wlogout
    ./hypridle.nix
    ./hyprlock.nix
    ./variables.nix
  ];
}
