{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # audacity
    dconf-editor
    # gimp
    gnome-disk-utility
    libreoffice
    obs-studio
    gromit-mpx
    # pitivi                            # video editing
    # gnome-calculator                  # calculator
    # mission-center                    # GUI resources monitor
    # soundwireserver
    # zenity
  ];
}
