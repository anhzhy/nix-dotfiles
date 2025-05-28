{ pkgs, ... }:
{
  home.packages = with pkgs; [
    ani-cli
    # aoc-cli                           # Advent of Code command-line tool
    # asciinema
    # asciinema-agg
    # binsider
    bitwise                           # cli tool for bit / hex manipulation
    caligula                          # User-friendly, lightweight TUI for disk imaging
    cava
    dysk                              # disk information
    eza                               # ls replacement
    entr                              # perform action when file change
    fd                                # find replacement
    ffmpeg
    file                              # Show file information
    gtrash                            # rm replacement, put deleted files in system trash
    hevi                              # hex viewer
    hexdump
    imv                               # image viewer
    jq                                # JSON processor
    killall
    libnotify
    lowfi
    pciutils
    # man-pages                         # extra man pages
    # mimeo
    mpv                               # video player
    ncdu                              # disk space
    nitch                             # systhem fetch util
    onefetch                          # fetch utility for git repo
    playerctl                         # controller for media players
    poweralertd
    programmer-calculator
    ripgrep                           # grep replacement
    shfmt                             # bash formatter
    smassh                            # typing test in the terminal
    tdf                               # cli pdf viewer
    treefmt                           # project formatter
    tldr
    toipe                             # typing test in the terminal
    ttyper                            # cli typing test
    zip
    unzip
    wavemon                           # monitoring for wireless network devices
    wl-clipboard                      # clipboard utils for wayland (wl-copy, wl-paste)
    wget
    # woomer
    yad
    yt-dlp
    xarchiver
    xdg-user-dirs
    xdg-utils
    # xxd

    winetricks
    wineWowPackages.wayland

    asciiquarium
    cbonsai                           # terminal screensaver
    cmatrix
    pipes                             # terminal screensaver
    sl
    tty-clock                         # cli clock
  ];
}