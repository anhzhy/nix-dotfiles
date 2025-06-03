{ pkgs, ... }:
{
  # programs.rofi = {
  #   enable = true;
  #   package = pkgs.rofi-wayland;
  #   plugins = with pkgs; [
  #     rofi-emoji-wayland
  #     rofi-games
  #   ];
  # };

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
