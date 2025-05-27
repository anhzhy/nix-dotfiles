{ ... }:
{
  programs.cava.enable = true;

  home.file = {
    ".config/cava/shaders" = {
      source = "./shaders";
      recursive = true;
    };
  };
}