{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # Nix
    nixd
    nixfmt

    # C / C++
    gcc
    gdb
    gef
    cmake
    libgcc
    gnumake
    valgrind
    clang-tools
    stdenv.cc.cc.lib
    extra-cmake-modules
    gobject-introspection

    # Python
    python3

    # Golang
    go

    # NodeJS/NestJS
    nodejs
    typescript
    typescript-language-server

    # Javascript
    gjs

    # Mobile
    android-tools
    android-studio-tools
  ];

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
    enableBashIntegration = true;
    enableZshIntegration = true;
  };

  programs.java = {
    enable = true;
    package = pkgs.jdk;
  };
}
