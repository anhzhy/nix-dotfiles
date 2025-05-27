{ pkgs, username, ... }:
let 
  config_dir = ./.config;
in
{
  home = {
    username = "${username}";
    homeDirectory = "/home/${username}";
  };

  imports = [
    ./p10k/p10k.nix
    ./git.nix
    ./btop.nix
    ./browser.nix
    ./discord.nix
    ./obsidian.nix
    ./games.nix
    ./bat.nix
    ./fzf.nix

    ./zsh
    ./fastfetch
    ./packages
    ./wallust
    ./mpv
    ./cava
  ];

  home.file = {
    ".config/hypr".source = "${config_dir}/hypr";
    # ".config/nvim".source = "${config_dir}/nvim";
    ".config/rofi".source = "${config_dir}/rofi";
    # ".config/swappy".source = "${config_dir}/swappy";
    # ".config/swaync".source = "${config_dir}/swaync";
    # ".config/Thunar".source = "${config_dir}/Thunar";
    ".config/waybar".source = "${config_dir}/waybar";
    # ".config/wlogout".source = "${config_dir}/wlogout";
  };

  home.packages = (with pkgs; [
    # Editor
    neovim
    vscode

    # Launcher / menu
    waybar
    wofi
    rofi


    # Audio visualizer
    cava

    # Network management
    swaynotificationcenter

    # File manager
    xfce.thunar

    # Desktop utilities
    wlogout
    hyprlock
    hypridle
    swww
  ]);

  programs.home-manager.enable = true;
  home.enableNixpkgsReleaseCheck = false;
  home.stateVersion = "25.05";
}
