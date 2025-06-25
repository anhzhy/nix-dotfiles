{ pkgs, ... }:
{
  xdg.configFile."fastfetch/config.jsonc".source = ./config.jsonc;
  xdg.configFile."fastfetch/config-compact.jsonc".source = ./config-compact.jsonc;

  home.packages = with pkgs; [
    fastfetch
    bc
    chafa
  ];
}
