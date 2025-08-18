{
  pkgs,
  ...
}:

{
  nixpkgs.config = {
    allowBroken = true;
    allowUnfree = true;
    allowUnfreePredicate = (_: true);
    permittedInsecurePackages = [
      "electron-25.9.0"
    ];
  };

  imports = [
    ./core
    ./drivers
  ];

  environment.systemPackages = with pkgs; [
    # --- Terminal Emulators ---
    kitty

    # --- Web Browsers ---
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
}
