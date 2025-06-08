{
  pkgs,
  ...
}:
{
  home.packages = with pkgs; [
    # Nix
    nixd # nix lsp
    nixfmt-rfc-style # nix formatter

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
    llvmPackages_20.clang-tools

    # Python
    python3Full
  ];
}
