{ pkgs, ... }:
{
  xdg.configFile."mpv/fonts".source = ./fonts;
  xdg.configFile."mpv/script-opts".source = ./script-opts;
  xdg.configFile."mpv/scripts".source = ./scripts;
  xdg.configFile."mpv/shaders".source = ./shaders;
  xdg.configFile."mpv/input.conf".text = builtins.readFile ./input.conf;
  xdg.configFile."mpv/mpv.conf".text = builtins.readFile ./mpv.conf;

  home.packages = with pkgs; [
    mpv
  ];
}
