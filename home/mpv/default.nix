{ ... }:
{
  imports = [
    ./config.nix
    ./script-opts.nix
  ];

  home.file = {
    ".config/mpv/fonts" = {
      source = "./fonts";
      recursive = true;
    };
    ".config/mpv/scripts" = {
      source = "./scripts";
      recursive = true;
    };
    ".config/mpv/shaders" = {
      source = "./shaders";
      recursive = true;
    };
  };
}