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
        ms-python.vscode-pylance

        ## C++
        llvm-vs-code-extensions.vscode-clangd
        ms-vscode.cpptools

        ## Go
        golang.go

        ## Rust
        rust-lang.rust-analyzer
        # matklad.rust-analyzer   # deprecated

        ## Linting
        dbaeumer.vscode-eslint

        ## Formatter
        esbenp.prettier-vscode

        ## Toml
        tamasfe.even-better-toml

        ## Theme
        jdinhlife.gruvbox
        jonathanharty.gruvbox-material-icon-theme
      ]
      ++ [
        ## Node + React
        pkgs.vscode-marketplace.msjsdiag.debugger-for-chrome

        ## PHP + Laravel
        pkgs.vscode-marketplace.onecentlin.laravel-blade
        pkgs.vscode-marketplace.bmewburn.vscode-intelephense-client
        pkgs.vscode-marketplace.xdebug.php-debug
      ];
  };
}
