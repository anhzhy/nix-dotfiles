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
      (with pkgs.vscode-extensions; [
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

        ## Vue
        vue.volar
        octref.vetur

        ## Theme
        jdinhlife.gruvbox
        jonathanharty.gruvbox-material-icon-theme
      ])
      ++ (with pkgs.vscode-marketplace; [
        mnismt.overwrite

        ## Node + React
        # msjsdiag.debugger-for-chrome # deprecated

        ## PHP + Laravel
        onecentlin.laravel-blade
        bmewburn.vscode-intelephense-client
        xdebug.php-debug

        # Odoo
        jigar-patel.odoosnippets

        # XML
        redhat.vscode-xml
        dotjoshjohnson.xml

        # CSV
        mechatroner.rainbow-csv

        # Jinja
        wholroyd.jinja

        # Lua Formatter
        johnnymorganz.stylua

        # Vue syntax highlight
        znck.vue

        # Vue syntax highlight
        pkgs.vscode-marketplace.znck.vue

        # Quickshell
        theqtcompany.qt-core
        theqtcompany.qt-qml
        theqtcompany.qt-cpp
        theqtcompany.qt-ui
        delgan.qml-format
      ]);
  };
}
