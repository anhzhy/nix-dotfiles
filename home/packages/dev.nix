{
  pkgs,
  ...
}:
{
  home.packages = with pkgs; [
    # Nix
    nix-direnv
    nixd
    nixfmt-rfc-style

    # C / C++
    gcc
    gdb
    gef
    cmake
    libgcc
    gnumake
    valgrind
    stdenv.cc.cc.lib
    extra-cmake-modules
    gobject-introspection
    llvmPackages_20.clang-tools

    # Python
    python3Full

    # NodeJS/NestJS
    nodejs
    nest-cli
  ];
}
