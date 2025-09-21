{ pkgs, ... }:
{
  xdg.configFile."rofi/config.rasi".source = ./config.rasi;
  xdg.configFile."rofi/config-wallpaper.rasi".source = ./config-wallpaper.rasi;

  home.packages = (
    with pkgs;
    [
      rofi
      rofi-emoji
      rofi-games
    ]
  );
}
