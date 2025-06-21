{ pkgs, ... }:
{
  xdg.configFile."matugen/templates".source = ./templates;
  xdg.configFile."matugen/config.toml".text = builtins.readFile ./config.toml;

  home.packages = with pkgs; [ matugen ];
}
