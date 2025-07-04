{ pkgs, ... }:
{
  xdg.configFile."rofi/config.rasi".source = ./config.rasi;

  home.packages = (
    with pkgs;
    [
      rofi-wayland
      rofi-emoji-wayland
      rofi-games
    ]
  );
}
