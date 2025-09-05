{ ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../nixos
    ../../home
  ];

  drivers.amdgpu.enable = false;
  drivers.intel.enable = false;
  drivers.nvidia.enable = true;
  drivers.nvidia-prime = {
    enable = true;
    intelBusID = "PCI:0:2:0";
    nvidiaBusID = "PCI:2:0:0";
  };
}
