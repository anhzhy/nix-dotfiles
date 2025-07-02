{ username, ... }:
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
    ./spicetify.nix
    ./thunar.nix
    ./obs-studio.nix
    ./fcitx5.nix
    ./xdg-mimes.nix

    ./ags
    ./zsh
    ./fastfetch
    ./packages
    ./vscodium
    ./hyprland
    ./cava
    ./wallust
    ./mpv
    ./nvim
    ./waybar
    ./matugen
  ];

  programs.home-manager.enable = true;
  home.enableNixpkgsReleaseCheck = false;
  home = {
    username = "${username}";
    homeDirectory = "/home/${username}";
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  home.stateVersion = "25.05"; # Did you read the comment?
}
