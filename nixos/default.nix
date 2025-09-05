{
  pkgs,
  lib,
  outputs,
  inputs,
  ...
}:

{
  nixpkgs = {
    overlays = builtins.attrValues outputs.overlays ++ [
      inputs.nix-vscode-extensions.overlays.default
    ];
    config = {
      allowBroken = true;
      allowUnfree = true;
      allowUnfreePredicate =
        pkg:
        builtins.elem (lib.getName pkg) [
          "cudatoolkit"
          "nvidia-persistenced"
          "nvidia-settings"
          "nvidia-x11"
        ];
      cudaSupport = true;
      permittedInsecurePackages = [
        "electron-25.9.0"
      ];
    };
  };

  imports = [
    ./core
    ./drivers
  ];

  environment.systemPackages = with pkgs; [
    # --- Terminal Emulators ---
    kitty

    # --- Text Editors ---
    vim
    nano

    # --- Version Control ---
    git

    # --- Utilities ---
    curl
    wget
    wsdd
  ];

  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
  };
}
