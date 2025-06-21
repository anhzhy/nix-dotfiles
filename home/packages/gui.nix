{ pkgs, ... }:
{
  home.packages = with pkgs; [
    dconf-editor
    # gimp
    gnome-disk-utility
    onlyoffice-desktopeditors
    gromit-mpx
    figma-linux
    slack
    bruno
    koodo-reader
    mattermost-desktop
    telegram-desktop
    # pitivi # video editing
    gnome-calculator # calculator
    mission-center # GUI resources monitor
    # soundwireserver
    # zenity
    dbeaver-bin
    qbittorrent
  ];
}
