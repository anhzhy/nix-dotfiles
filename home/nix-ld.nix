{ pkgs, ... }:
{
  programs.nix-ld = {
    enable = true;
    libraries = with pkgs; [
      # cairo
      # cups
      # curl
      # dbus
      # fontconfig
      # freetype
      # fuse
      # fuse3
      # gdk-pixbuf
      # glib
      # gtk3
      # harfbuzz
      libGL
      libappindicator-gtk3
      libdrm
      libglvnd
      libnotify
      libpulseaudio
      libunwind
      libusb1
      libuuid
      libxkbcommon
      libxml2
      mesa
      pango
      vulkan-loader
      xorg.libX11
      xorg.libXScrnSaver
      xorg.libXcomposite
      xorg.libXcursor
      xorg.libXdamage
      xorg.libXext
      xorg.libXfixes
      xorg.libXi
      xorg.libXrandr
      xorg.libXrender
      xorg.libXtst
      xorg.libxcb
      xorg.libxkbfile
      xorg.libxshmfence
    ];
  };
}
