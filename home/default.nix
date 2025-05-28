{ pkgs, username, inputs, ... }:
let 
  config_dir = ./.config;
in
{
  home = {
    username = "${username}";
    homeDirectory = "/home/${username}";
  };

  home.sessionVariables = {
    NIXOS_OZONE_WL = 1;
    __GL_GSYNC_ALLOWED = 0;
    __GL_VRR_ALLOWED = 0;
    _JAVA_AWT_WM_NONEREPARENTING = 1;
    SSH_AUTH_SOCK = "/run/user/1000/ssh-agent";
    DISABLE_QT5_COMPAT = 0;
    GDK_BACKEND = "wayland";
    ANKI_WAYLAND = 1;
    DIRENV_LOG_FORMAT = "";
    WLR_DRM_NO_ATOMIC = 1;
    # QT_AUTO_SCREEN_SCALE_FACTOR = 1;
    # QT_WAYLAND_DISABLE_WINDOWDECORATION = 1;
    # QT_QPA_PLATFORM = "xcb";
    # QT_QPA_PLATFORMTHEME = "qt5ct";
    # QT_STYLE_OVERRIDE = "kvantum";
    MOZ_ENABLE_WAYLAND = 1;
    WLR_BACKEND = "vulkan";
    WLR_RENDERER = "vulkan";
    WLR_NO_HARDWARE_CURSORS = 1;
    XDG_CURRENT_DESKTOP = "Hyprland";
    XDG_SESSION_TYPE = "wayland";
    XDG_SESSION_DESKTOP = "Hyprland";
    SDL_VIDEODRIVER = "wayland";
    CLUTTER_BACKEND = "wayland";
    GTK_THEME = "Colloid-Green-Dark-Gruvbox";
    GRIMBLAST_HIDE_CURSOR = 0;
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
    ./swappy.nix
    ./lazygit.nix
    ./gtk.nix
    ./viewnior.nix
    ./wallust.nix
    ./spicetify.nix
    ./thunar.nix

    ./zsh
    ./fastfetch
    ./packages
    ./vscodium
    ./superfile
  ];

  home.file = {
    ".config/hypr".source = "${config_dir}/hypr";
    ".config/mpv".source = "${config_dir}/mpv";
    ".config/nvim".source = "${config_dir}/nvim";
    ".config/rofi".source = "${config_dir}/rofi";
    ".config/waybar".source = "${config_dir}/waybar";
  };

  home.packages = (with pkgs; [
    neovim
    
    waybar
    rofi-wayland
    hyprlock
    hypridle
    swww
  ]);

  programs.home-manager.enable = true;
  home.enableNixpkgsReleaseCheck = false;
  home.stateVersion = "25.05";
}
