{ pkgs, username, ... }:
let 
  config_dir = ./configs;
in
{
  imports = [
    # hyprland.homeManagerModules.default
    # ./git.nix
    # ./gtk.nix
    # ./shell.nix
    # ./config.nix
    # ./packages.nix
    # ./programs.nix
    # ./environment.nix
  ];

  home = {
    username = "${username}";
    homeDirectory = "/home/${username}";
  };

  home.file = {
    ".config/nvim".source = "${config_dir}/nvim";
    # ".config/wallpapers".source = "${config_dir}/wallpapers";
    # ".config/kitty".source = "${config_dir}/kitty";
    # ".config/neofetch".source = "${config_dir}/neofetch";
    # ".config/hypr".source = "${config_dir}/hypr";
    # ".config/swayidle".source = "${config_dir}/swayidle";
    # ".config/swaylock".source = "${config_dir}/swaylock";
    # ".config/wlogout".source = "${config_dir}/wlogout";
    # ".config/waybar".source = "${config_dir}/waybar";
    # ".config/btop".source = "${config_dir}/btop";
    # ".config/wofi".source = "${config_dir}/wofi";
    # ".config/mako".source = "${config_dir}/mako";
  };

  home.packages = (with pkgs; [
    #User Apps
    vscode
    wallust

    #utils
    ranger
    xflux

    #misc 
    cava
    rofi
    nitch
    grim
    slurp
  ]);

  programs.home-manager.enable = true;
  home.enableNixpkgsReleaseCheck = false;
  home.stateVersion = "25.05";
}
