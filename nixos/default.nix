{ config, pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.allowUnfreePredicate = (_: true);
  nixpkgs.config.permittedInsecurePackages = [
    "electron-25.9.0"
  ];

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

  # environment.sessionVariables.NIXOS_OZONE_WL = "1";
  environment.systemPackages = with pkgs; [
    bc
    baobab
    btrfs-progs
    clang
    curl
    cpufrequtils
    duf
    findutils
    ffmpeg   
    killall  
    libappindicator
    libnotify
    openssl
    pciutils
    vim
    xdg-user-dirs
    xdg-utils
    acpi
    brightnessctl
    cpupower-gui
    powertop
    bat
    btop
    eza
    fzf
    gnumake
    lm_sensors
    fastfetch
    ripgrep
    tldr
    unzip
    openssl
    openssl.dev
    pkg-config
    wget
    xfce.thunar
    zip
    glib 
    nwg-look
    libevdev
    libsForQt5.qt5.qtbase
    libsForQt5.qt5.qttools
    libsForQt5.qt5.qtdeclarative
    qt6.qtwayland
    qt6.qtshadertools
    vulkan-headers
    wayland-protocols
  ];
}
