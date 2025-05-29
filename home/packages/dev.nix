{ pkgs, ... }:
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
    gnumake
    valgrind
    llvmPackages_20.clang-tools

    # Python
    python310
    libxml2
    libxslt
    # python312Packages.ipython
  ];

  # devShells."x86_64-linux".default = pkgs.mkShell {
  #   packages = with pkgs; [
  #     nodejs
  #     python3
  #   ];

  # };
}
