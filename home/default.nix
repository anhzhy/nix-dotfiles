{ pkgs, username, ... }:
let 
  config_dir = ./.config;
in
{
  imports = [
    ./p10k/p10k.nix
    ./git.nix
    ./btop.nix
  
    ./zsh
    ./fastfetch
  ];

  home = {
    username = "${username}";
    homeDirectory = "/home/${username}";
  };

  home.file = {
    ".config/btop".source = "${config_dir}/btop";
    ".config/cava".source = "${config_dir}/cava";
    ".config/hypr".source = "${config_dir}/hypr";
    ".config/mpv".source = "${config_dir}/mpv";
    ".config/nvim".source = "${config_dir}/nvim";
    ".config/rofi".source = "${config_dir}/rofi";
    ".config/swappy".source = "${config_dir}/swappy";
    ".config/swaync".source = "${config_dir}/swaync";
    ".config/Thunar".source = "${config_dir}/Thunar";
    ".config/wallust".source = "${config_dir}/wallust";
    ".config/waybar".source = "${config_dir}/waybar";
    ".config/wlogout".source = "${config_dir}/wlogout";
  };

  home.packages = (with pkgs; [
    # Multimedia
    mpv

    # System monitoring and info
    # btop

    # Editor
    neovim
    vscode
    obsidian

    # Launcher / menu
    waybar
    wofi
    rofi

    # Screenshot tool
    swappy

    # Audio visualizer
    cava

    # Network management
    swaynotificationcenter

    # File manager
    xfce.thunar

    # Desktop utilities
    wallust
    wlogout
    hyprlock
    hypridle
    swww
    eza
    fzf
    tldr
    findutils

    # Others
    asciiquarium
    cbonsai
    cmatrix
    pipes

    # Compiler
    clang
  ]);

  programs.home-manager.enable = true;
  home.enableNixpkgsReleaseCheck = false;
  home.stateVersion = "25.05";
}
