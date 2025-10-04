{ lib, graphic, ... }:
{
  imports = [
    ./amd-drivers.nix
    ./intel-drivers.nix
    ./nvidia-drivers.nix
    ./nvidia-prime-drivers.nix
  ];

  drivers = {
    amdgpu.enable = graphic == "amd";
    intel.enable = graphic == "intel" || graphic == "hybrid";
    nvidia.enable = graphic == "nvidia" || graphic == "hybrid";
    nvidia-prime = lib.mkIf (graphic == "hybrid") {
      enable = true;
      intelBusID = "PCI:0:2:0";
      nvidiaBusID = "PCI:2:0:0";
    };
  };
}
