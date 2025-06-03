{
  pkgs,
  pkgs23,
  ...
}:
{
  home.packages =
    with pkgs;
    [
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
      # python3
      # python312Packages.ipython
      sassc
    ]
    ++ [
      pkgs23.python38
      pkgs23.libxml2
      pkgs23.libxslt
      pkgs23.openldap
      pkgs23.cyrus_sasl
      pkgs23.libstdcxx5
    ];
}
