{
  config,
  pkgs,
  inputs,
  ...
}:
{
  imports = [
    inputs.auto-cpufreq.nixosModules.default
    ./hardware-configuration.nix
    ../../nixos
    ../../overlays
  ];

  drivers.amdgpu.enable = false;
  drivers.intel.enable = false;
  drivers.nvidia.enable = true;
  drivers.nvidia-prime = {
    enable = true;
    intelBusID = "PCI:0:2:0";
    nvidiaBusID = "PCI:2:0:0";
  };

  services = {
    power-profiles-daemon.enable = false;

    upower = {
      enable = true;
      percentageLow = 20;
      percentageCritical = 5;
      percentageAction = 3;
      criticalPowerAction = "PowerOff";
      usePercentageForPolicy = true;
    };

    thermald.enable = true;
    tlp.enable = false;
    # tlp.settings = {
    #   CPU_ENERGY_PERF_POLICY_ON_AC = "power";
    #   CPU_ENERGY_PERF_POLICY_ON_BAT = "power";

    #   CPU_BOOST_ON_AC = 1;
    #   CPU_BOOST_ON_BAT = 1;

    #   CPU_HWP_DYN_BOOST_ON_AC = 1;
    #   CPU_HWP_DYN_BOOST_ON_BAT = 1;

    #   PLATFORM_PROFILE_ON_AC = "performance";
    #   PLATFORM_PROFILE_ON_BAT = "performance";

    #   INTEL_GPU_MIN_FREQ_ON_AC = 500;
    #   INTEL_GPU_MIN_FREQ_ON_BAT = 500;
    #   # INTEL_GPU_MAX_FREQ_ON_AC=0;
    #   # INTEL_GPU_MAX_FREQ_ON_BAT=0;
    #   # INTEL_GPU_BOOST_FREQ_ON_AC=0;
    #   # INTEL_GPU_BOOST_FREQ_ON_BAT=0;

    #   # PCIE_ASPM_ON_AC = "default";
    #   # PCIE_ASPM_ON_BAT = "powersupersave";
    # };
  };

  powerManagement = {
    enable = false;
    # cpuFreqGovernor = "schedutil";
  };

  programs.auto-cpufreq = {
    enable = true;

    settings = {
      charger = {
        governor = "schedutil"; # can be "schedutil", "ondemand", etc.
        turbo = "never"; # can be "always", "auto", "never"
      };
      battery = {
        governor = "powersave";
        turbo = "never";
      };
    };
  };

  environment.systemPackages = with pkgs; [
    acpi
    brightnessctl
    cpupower-gui
    powertop
  ];

  services.logind.extraConfig = ''
    # don’t shutdown when power button is short-pressed
    HandlePowerKey=ignore
  '';

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

  services.cpupower-gui.enable = true;
}
