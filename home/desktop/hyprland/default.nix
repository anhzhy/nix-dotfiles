{ inputs, ... }:
{
  imports = [
    inputs.hyprland.homeManagerModules.default
    ./hypr
    ./rofi
    ./wlogout
    ./waybar
    ./hypridle.nix
    ./hyprlock.nix
    ./variables.nix
  ];
}
