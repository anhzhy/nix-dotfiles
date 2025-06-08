{ pkgs, username, ... }:
let
  config_dir = ./.config;
in
{
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
    ./swappy.nix
    ./lazygit.nix
    ./gtk.nix
    ./viewnior.nix
    ./wallust.nix
    ./spicetify.nix
    ./thunar.nix
    ./obs-studio.nix
    ./fcitx5.nix
    ./xdg-mimes.nix

    ./zsh
    ./fastfetch
    ./packages
    ./vscodium
    ./hyprland
    ./cava
  ];

  home = {
    username = "${username}";
    homeDirectory = "/home/${username}";
  };

  home.file = {
    # ".config/hypr".source = "${config_dir}/hypr";
    ".config/mpv".source = "${config_dir}/mpv";
    ".config/nvim".source = "${config_dir}/nvim";
    # ".config/rofi".source = "${config_dir}/rofi";
    ".config/waybar".source = "${config_dir}/waybar";
  };

  home.packages = (
    with pkgs;
    [
      neovim-unwrapped
      waybar
    ]
  );

  programs.home-manager.enable = true;
  home.enableNixpkgsReleaseCheck = false;
  home.stateVersion = "25.05";
}
