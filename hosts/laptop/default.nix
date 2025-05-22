{ ... }:
{
  imports = [
    ./hardware-configuration.nix
    ../../nixos
  ];

  # tlp.settings = {
  #   CPU_ENERGY_PERF_POLICY_ON_AC = "power";
  #   CPU_ENERGY_PERF_POLICY_ON_BAT = "power";
  #
  #   CPU_BOOST_ON_AC = 1;
  #   CPU_BOOST_ON_BAT = 1;
  #
  #   CPU_HWP_DYN_BOOST_ON_AC = 1;
  #   CPU_HWP_DYN_BOOST_ON_BAT = 1;
  #
  #   PLATFORM_PROFILE_ON_AC = "performance";
  #   PLATFORM_PROFILE_ON_BAT = "performance";
  #
  #   INTEL_GPU_MIN_FREQ_ON_AC = 500;
  #   INTEL_GPU_MIN_FREQ_ON_BAT = 500;
  #   INTEL_GPU_MAX_FREQ_ON_AC=0;
  #   INTEL_GPU_MAX_FREQ_ON_BAT=0;
  #   INTEL_GPU_BOOST_FREQ_ON_AC=0;
  #   INTEL_GPU_BOOST_FREQ_ON_BAT=0;
  #   PCIE_ASPM_ON_AC = "default";
  #   PCIE_ASPM_ON_BAT = "powersupersave";
  # };

  logind.extraConfig = ''
    # don’t shutdown when power button is short-pressed
    HandlePowerKey=ignore
  '';
}
