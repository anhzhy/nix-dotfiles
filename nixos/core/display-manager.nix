{ ... }:
{
  services = {
    displayManager = {
      sddm = {
        enable = true;
        wayland.enable = true;
        theme = "breeze"; 
      };
      defaultSession = "hyprland";
    };
  };
}
