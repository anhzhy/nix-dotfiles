{ pkgs, ... }:
let
  jonathanharty.gruvbox-material-icon-theme = pkgs.vscode-utils.buildVscodeMarketplaceExtension {
    mktplcRef = {
      name = "gruvbox-material-icon-theme";
      publisher = "JonathanHarty";
      version = "1.1.5";
      hash = "sha256-86UWUuWKT6adx4hw4OJw3cSZxWZKLH4uLTO+Ssg75gY=";
    };
  };
in
{
  programs.vscode.profiles.default = {
    extensions =
      with pkgs.vscode-extensions;
      [
        ## Nix
        jnoortheen.nix-ide
        arrterian.nix-env-selector

        ## Python
        ms-python.python
        ms-python.debugpy
        ms-python.vscode-pylance
        ms-python.black-formatter
        ms-python.isort

        ## C++
        llvm-vs-code-extensions.vscode-clangd
        ms-vscode.cmake-tools
        # ms-vscode.cpptools

        ## Go
        golang.go

        ## Rust
        rust-lang.rust-analyzer
        # matklad.rust-analyzer # deprecated

        ## Linting
        dbaeumer.vscode-eslint

        ## Formatter
        esbenp.prettier-vscode

        ## Toml
        tamasfe.even-better-toml

        ## Lua
        sumneko.lua

        ## Theme
        jdinhlife.gruvbox
        jonathanharty.gruvbox-material-icon-theme
      ]
      ++ [
        ## Node + React
        # pkgs.vscode-marketplace.msjsdiag.debugger-for-chrome # deprecated

        ## PHP + Laravel
        pkgs.vscode-marketplace.onecentlin.laravel-blade
        pkgs.vscode-marketplace.bmewburn.vscode-intelephense-client
        pkgs.vscode-marketplace.xdebug.php-debug

        # Odoo
        pkgs.vscode-marketplace.jigar-patel.odoosnippets

        # XML
        pkgs.vscode-marketplace.redhat.vscode-xml
        pkgs.vscode-marketplace.dotjoshjohnson.xml

        # CSV
        pkgs.vscode-marketplace.mechatroner.rainbow-csv

        # Jinja
        pkgs.vscode-marketplace.wholroyd.jinja

        # Lua Formatter
        pkgs.vscode-marketplace.johnnymorganz.stylua

        # Quickshell
        pkgs.vscode-marketplace.theqtcompany.qt-core
        pkgs.vscode-marketplace.theqtcompany.qt-qml
        pkgs.vscode-marketplace.theqtcompany.qt-cpp
        pkgs.vscode-marketplace.theqtcompany.qt-ui
        pkgs.vscode-marketplace.delgan.qml-format
      ];
  };
}
