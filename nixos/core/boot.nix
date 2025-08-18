{
  pkgs,
  lib,
  inputs,
  ...
}:
{
  imports = [
    inputs.lanzaboote.nixosModules.lanzaboote
  ];

  boot = {
    initrd.verbose = false;
    lanzaboote = {
      enable = true;
      pkiBundle = "/var/lib/sbctl";
    };
    # kernelPackages = pkgs.linuxPackages_latest;
    kernelPackages = pkgs.linuxPackages_zen;
    kernelParams = [
      "quiet"
      "udev.log_level=3"
      "systemd.mask=systemd-vconsole-setup.service"
      "systemd.mask=dev-tpmrm0.device"
      "nowatchdog"
      "modprobe.blacklist=sp5100_tco"
      "modprobe.blacklist=iTCO_wdt"
    ];
    initrd.availableKernelModules = [
      "xhci_pci"
      "ahci"
      "nvme"
      "usb_storage"
      "usbhid"
      "sd_mod"
    ];
    loader.systemd-boot.enable = lib.mkForce false;
    initrd.systemd.enable = true;
    plymouth.enable = true;
  };

  environment.systemPackages = with pkgs; [ sbctl ];
}
