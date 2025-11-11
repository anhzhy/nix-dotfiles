{
  pkgs,
  inputs,
  ...
}:
{
  imports = [
    inputs.nix-gaming.nixosModules.platformOptimizations
  ];

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = false;
    gamescopeSession.enable = true;
    extraCompatPackages = [ pkgs.proton-ge-bin ];
    platformOptimizations.enable = true;
  };

  programs.gamescope = {
    enable = true;
    capSysNice = true;
    args = [
      "--rt"
      "--expose-wayland"
    ];
  };

  programs.gamemode = {
    enable = true;
    settings = {
      general = {
        softrealtime = "auto";
        renice = 15;
      };
    };
  };

  programs.zsh.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  xdg.portal = {
    enable = true;
    config = {
      common = {
        default = [ "gtk" ];
      };
      hyprland = {
        default = [
          "gtk"
          "hyprland"
        ];
      };
      kde = {
        default = [
          "gtk"
          "kde"
        ];
      };
    };
    extraPortals = with pkgs; [
      xdg-desktop-portal-gtk
    ];
  };

  programs.dconf.enable = true;
  programs.adb.enable = true;

  programs.nix-ld = {
    enable = true;
    libraries = with pkgs; [
      atk
      gcc
      icu
      nss
      glib
      dbus
      nspr
      zlib
      expat
      glibc
      brotli
      systemd
      openssl
      libevdev
      pipewire
      alsa-lib
      at-spi2-atk
      at-spi2-core
      stdenv.cc.cc
      stdenv.cc.libc
    ];
  };

  environment.systemPackages = with pkgs; [
    steam-run
    lutris
    atk
    gcc
    icu
    nss
    glib
    dbus
    nspr
    zlib
    expat
    glibc
    brotli
    systemd
    openssl
    libevdev
    pipewire
    alsa-lib
    at-spi2-atk
    at-spi2-core
    stdenv.cc.cc
    stdenv.cc.libc
  ];
}
