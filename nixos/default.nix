{
  pkgs,
  ...
}:

{
  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.allowUnfreePredicate = (_: true);
  nixpkgs.config.permittedInsecurePackages = [
    "electron-25.9.0"
  ];

  imports = [
    ./core
    ./options/intel-drivers.nix
    ./options/nvidia-drivers.nix
    ./options/nvidia-prime-drivers.nix
  ];

  drivers.intel.enable = true;
  drivers.nvidia.enable = true;
  drivers.nvidia-prime = {
    enable = true;
    intelBusID = "PCI:0:2:0";
    nvidiaBusID = "PCI:2:0:0";
  };

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
