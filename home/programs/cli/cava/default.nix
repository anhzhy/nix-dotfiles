{ pkgs, ... }:
{
  xdg.configFile."cava/shaders".source = ./shaders;

  home.packages = with pkgs; [
    cava
  ];
}
