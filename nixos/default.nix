{ config, pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.allowUnfreePredicate = (_: true);
  # nixpkgs.config.permittedInsecurePackages = [
  #   "electron-25.9.0"
  # ];

  imports = [
    ./core
    ./options/intel-drivers.nix
    ./options/nvidia-drivers.nix
    ./options/nvidia-prime-drivers.nix
  ];

  drivers.intel.enable = true;
  drivers.nvidia.enable = true;
  drivers.nvidia-prime = {
    enable = false;
    intelBusID = "";
    nvidiaBusID = "";
  };

  environment.sessionVariables.NIXOS_OZONE_WL = "1";
  environment.systemPackages = with pkgs; [
    # --- Terminal Emulators ---
    kitty

    # --- Status Bar and Launcher ---
    waybar
    wofi

    # --- Web Browsers ---
    firefox

    # --- Text Editors ---
    neovim
    vim
    nano

    # --- Version Control ---
    git

    # --- Utilities ---
    htop
    curl
    wget
    openssl
    glib
    glibc
    libevdev
    zlib
    expat
    icu
    nss
    # asciiquarium
    # eza
    # fzf
    # tldr
    # findutils
    # clang
  ];
}
