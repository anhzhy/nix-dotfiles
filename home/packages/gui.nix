{ pkgs, ... }:
{
  home.packages = with pkgs; [
    dconf-editor
    # gimp
    gnome-disk-utility
    libreoffice
    gromit-mpx
    figma-linux
    slack
    bruno
    koodo-reader
    mattermost-desktop
    # pitivi                            # video editing
    # gnome-calculator                  # calculator
    # mission-center                    # GUI resources monitor
    # soundwireserver
    # zenity
  ];
}
