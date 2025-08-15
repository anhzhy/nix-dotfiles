{ pkgs, ... }:
{
  xdg.configFile."rofi/config.rasi".source = ./config.rasi;
  xdg.configFile."rofi/config-wallpaper.rasi".source = ./config_wallpaper.rasi;

  home.packages = (
    with pkgs;
    [
      rofi-wayland
      rofi-emoji-wayland
      rofi-games
    ]
  );
}
