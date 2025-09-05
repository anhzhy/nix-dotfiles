{
  pkgs,
  ...
}:
{
  boot = {
    initrd.verbose = false;
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
    loader = {
      systemd-boot.enable = true;
      efi = {
        canTouchEfiVariables = true;
        efiSysMountPoint = "/boot";
      };
      timeout = null;
    };
    tmp.cleanOnBoot = true;
    initrd.systemd.enable = true;
    plymouth.enable = true;
  };
}
