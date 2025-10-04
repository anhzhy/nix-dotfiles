{ desktop, ... }:
{
  imports = [
    ./hyprland.nix
    ./plasma.nix
  ];

  ${desktop}.enable = true;
}
