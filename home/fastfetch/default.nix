{ pkgs, ... }:
{
  imports = [
    ./config.nix
    ./config-compact.nix
  ];

  home.packages = with pkgs; [
    fastfetch
    bc
    chafa
  ];
}
