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
    ]
    ++ [
      pkgs23.python38
      pkgs23.libxml2
      pkgs23.libxslt
      pkgs23.openldap
      pkgs23.cyrus_sasl
      # pkgs23.python38Packages.numpy
      # pkgs23.python38Packages.requests
    ];

  # devShells."x86_64-linux".default = pkgs.mkShell {
  #   packages = with pkgs; [
  #     nodejs
  #     python3
  #   ];

  # };
}
