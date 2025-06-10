{ pkgs, ... }:
{
  xdg.configFile."waybar/modules".source = ./modules;
  xdg.configFile."waybar/scripts".source = ./scripts;
  xdg.configFile."waybar/config".text = builtins.readFile ./config;

  home.packages = with pkgs; [ waybar ];
}
