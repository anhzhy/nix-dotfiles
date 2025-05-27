{ ... }:
{
  imports = [
    ./shaders/bar_spectrum.nix
    ./shaders/normalized_bars.nix
    ./shaders/northern_lights.nix
    ./shaders/pass_through.nix
    ./shaders/spectrogram.nix
    ./shaders/winamp_line_style_spectrum.nix
  ];

  programs.cava.enable = true;
}