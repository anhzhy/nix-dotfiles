{ config, pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.allowUnfreePredicate = (_: true);
  nixpkgs.config.permittedInsecurePackages = [
    "electron-25.9.0"
  ];

  nixpkgs.overlays = [
    (final: prev: {
      qt6 = prev.qt6.overrideScope (finalq: prevq: {
        qtbase = prevq.qtbase.overrideAttrs (old: {
          version = "6.8.3";
            src = prev.fetchFromGitHub {
              owner = "qt";
              repo = "qtbase";
              rev = "v6.8.3";
              hash = "sha256-pjI8LhgT1aEiGHcR7t3N/D/qlEjgOzYHJ58tCPrOfW0=";
            };
            patches = old.patches;
          });
        qttools = prevq.qttools.overrideAttrs (old: {
          version = "6.8.3";
          src = prev.fetchFromGitHub {
            owner = "qt";
            repo = "qttools";
            rev = "v6.8.3";
            hash = "sha256-4ZxKkHQ/HAdmZolR0muLTh6SQ7mKW4+Lr/ntv8mPQo4=";
          };
        });
        qtdeclarative = prevq.qtdeclarative.overrideAttrs (old: {
          version = "6.8.3";
          src = prev.fetchFromGitHub {
            owner = "qt";
            repo = "qtdeclarative";
            rev = "v6.8.3";
            hash = "sha256-wCvqcKQ22IznV2nhw0X2EQ+T5rhSOgc8Rt5W0dre27I=";
          };
        });
      });
    })
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
    # cpupower-gui
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
  ];
}
