{
  config,
  pkgs,
  ...
}:
{
  imports = [
    ./hardware-configuration.nix
    ../../nixos
  ];

  environment.systemPackages = with pkgs; [
    acpi
    brightnessctl
    cpupower-gui
    powertop
  ];

  services = {
    power-profiles-daemon.enable = false;
    cpupower-gui.enable = true;

    logind.settings.Login = {
      powerKey = "ignore";
    };

    upower = {
      enable = true;
      percentageLow = 20;
      percentageCritical = 5;
      percentageAction = 3;
      criticalPowerAction = "PowerOff";
      usePercentageForPolicy = true;
    };

    thermald.enable = true;
    tlp.enable = true;
    tlp.settings = {
      CPU_ENERGY_PERF_POLICY_ON_BAT = "power";
      CPU_ENERGY_PERF_POLICY_ON_AC = "performance";

      CPU_SCALING_GOVERNOR_ON_AC = "performance";
      CPU_SCALING_GOVERNOR_ON_BAT = "powersave";

      PLATFORM_PROFILE_ON_AC = "performance";
      PLATFORM_PROFILE_ON_BAT = "powersave";

      START_CHARGE_THRESH_BAT0 = 82;
      STOP_CHARGE_THRESH_BAT0 = 95;
    };
  };

  powerManagement = {
    enable = true;
    cpuFreqGovernor = "schedutil";
  };

  boot = {
    kernelModules = [ "acpi_call" ];
    extraModulePackages =
      with config.boot.kernelPackages;
      [
        acpi_call
        cpupower
      ]
      ++ [ pkgs.cpupower-gui ];
  };
}
