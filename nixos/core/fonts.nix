{ config, lib, pkgs, ... }:

{
  fonts = {
    packages = with pkgs; [
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-emoji
      # nerd-fonts
      twemoji-color-font
      fira-code
      fira-code-symbols
    ];
  };

  environment.systemPackages = with pkgs; [
    twemoji-color-font
  ];
}
