{
  pkgs,
  outputs,
  ...
}:

{
  nixpkgs = {
    overlays = outputs.overlays;
    config = outputs.config;
  };

  imports = [
    ./core
    ./desktops
    ./drivers
  ];

  environment.systemPackages = with pkgs; [
    # --- Terminal Emulators ---
    kitty

    # --- Browsers ---
    firefox

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
