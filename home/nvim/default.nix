{ pkgs, inputs, ... }:
{
  imports = [ inputs.nvchad4nix.homeManagerModule ];

  programs.nvchad = {
    enable = true;
    extraPackages = with pkgs; [
      nixd
      nixfmt-classic
      nixfmt-rfc-style
      # javascript-typescript-langserver
      # jsonfmt
      # lemminx
      # prettierd
      # nodePackages.bash-language-server
      # docker-compose-language-service
      # dockerfile-language-server-nodejs
      # emmet-language-server
      /*
         (python3.withPackages (ps:
        with ps; [
          python-lsp-server
          flake8
        ]))
      */
    ];
    hm-activation = true;
    backup = false;
  };

  # home.packages = with pkgs; [
  #   neovim-unwrapped
  # ];
}
