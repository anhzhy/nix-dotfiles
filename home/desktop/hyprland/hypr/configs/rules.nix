{ ... }:
{
  wayland.windowManager.hyprland.settings = {
    windowrule = [
      # --- Browser ----
      "tag +browser, class:^([Ff]irefox|org.mozilla.firefox|[Ff]irefox-esr|[Ff]irefox-bin)$"
      "tag +browser, class:^([Gg]oogle-chrome(-beta|-dev|-unstable)?)$"
      "tag +browser, class:^(chrome-.+-Default)$"
      "tag +browser, class:^([Cc]hromium)$"
      "tag +browser, class:^([Mm]icrosoft-edge(-stable|-beta|-dev|-unstable))$"
      "tag +browser, class:^(Brave-browser(-beta|-dev|-unstable)?)$"
      "tag +browser, class:^([Tt]horium-browser|[Cc]achy-browser)$"
      "tag +browser, class:^(zen-beta|zen)$"

      # --- Email ---
      "tag +email, class:^([Tt]hunderbird|org.gnome.Evolution)$"
      "tag +email, class:^(eu.betterbird.Betterbird)$"

      # --- IDE ---
      "tag +projects, class:^(codium|codium-url-handler|VSCodium)$"
      "tag +projects, class:^(VSCode|code-url-handler)$"
      "tag +projects, class:^(jetbrains-.+)$" # JetBrains IDEs

      # --- Screen Sharing ---
      "tag +screenshare, class:^(com.obsproject.Studio)$"

      # --- IM ---
      "tag +im, class:^([Dd]iscord|[Ww]ebCord|[Vv]esktop)$"
      "tag +im, class:^([Ff]erdium)$"
      "tag +im, class:^([Ww]hatsapp-for-linux)$"
      "tag +im, class:^(ZapZap|com.rtosta.zapzap)$"
      "tag +im, class:^(org.telegram.desktop|io.github.tdesktop_x64.TDesktop)$"
      "tag +im, class:^(teams-for-linux)$"

      # --- Games ---
      "tag +games, class:^(gamescope)$"
      "tag +games, class:^(steam_app_\\d+)$"

      # --- Game Store ---
      "tag +gamestore, class:^([Ss]team)$"
      "tag +gamestore, title:^([Ll]utris)$"
      "tag +gamestore, class:^(com.heroicgameslauncher.hgl)$"

      # --- File Manager ---
      "tag +file-manager, class:^([Tt]hunar|org.gnome.Nautilus|[Pp]cmanfm-qt)$"
      "tag +file-manager, class:^(app.drey.Warp)$"

      # --- Wallpaper ---
      "tag +wallpaper, class:^([Ww]aytrogen)$"

      # --- Multimedia ---
      "tag +multimedia, class:^([Aa]udacious)$"

      # --- Multimedia-video ---
      "tag +multimedia_video, class:^([Mm]pv|vlc)$"

      # --- Settings ---
      "tag +settings, title:^(ROG Control)$"
      "tag +settings, class:^(wihotspot(-gui)?)$" # wifi hotspot
      "tag +settings, class:^([Bb]aobab|org.gnome.[Bb]aobab)$" # Disk usage analyzer
      "tag +settings, class:^(gnome-disks|wihotspot(-gui)?)$"
      "tag +settings, title:(Kvantum Manager)"
      "tag +settings, class:^(file-roller|org.gnome.FileRoller)$" # archive manager
      "tag +settings, class:^(nm-applet|nm-connection-editor|blueman-manager)$"
      "tag +settings, class:^(pavucontrol|org.pulseaudio.pavucontrol|com.saivert.pwvucontrol)$"
      "tag +settings, class:^(qt5ct|qt6ct|[Yy]ad)$"
      "tag +settings, class:(xdg-desktop-portal-gtk)"
      "tag +settings, class:^(org.kde.polkit-kde-authentication-agent-1)$"
      "tag +settings, class:^([Rr]ofi)$"

      # --- Viewer ---
      "tag +viewer, class:^(gnome-system-monitor|org.gnome.SystemMonitor|io.missioncenter.MissionCenter)$"
      "tag +viewer, class:^(evince)$"
      "tag +viewer, class:^(eog|org.gnome.Loupe|viewnior)$"

      # --- Special ---
      "noblur, tag:multimedia_video*"
      "opacity 1.0, tag:multimedia_video*"

      # --- Positioning ---
      # "center,floating:1" # commented out in original
      "center, class:([Tt]hunar), title:negative:(.*[Tt]hunar.*)"
      "center, title:^(ROG Control)$"
      "center, title:^(Keybindings)$"
      "center, class:^(pavucontrol|org.pulseaudio.pavucontrol|com.saivert.pwvucontrol)$"
      "center, class:^([Ww]hatsapp-for-linux|ZapZap|com.rtosta.zapzap)$"
      "center, class:^([Ff]erdium)$"
      "move 72% 7%,title:^(Picture-in-Picture)$"
      # "move 72% 7%,title:^(Firefox)$"

      # Idle inhibit for fullscreen
      # "idleinhibit fullscreen, class:^(*)$" # commented out
      # "idleinhibit fullscreen, title:^(*)$" # commented out
      "idleinhibit fullscreen, fullscreen:1"

      # Move to workspace
      "workspace 1, tag:email*"
      "workspace 2, tag:browser*"
      # "workspace 3, class:^([Tt]hunar)$" # commented out
      # "workspace 3, tag:projects*" # commented out
      "workspace 5, tag:gamestore*"
      "workspace 7, tag:im*"
      "workspace 8, tag:games*"

      # Move to workspace silently
      "workspace 4 silent, tag:screenshare*"
      "workspace 6 silent, class:^(virt-manager)$"
      "workspace 6 silent, class:^(.virt-manager-wrapped)$"
      "workspace 9 silent, tag:multimedia*"

      # Floating windows
      "float, tag:wallpaper*"
      "float, tag:settings*"
      "float, tag:viewer*"
      "float, class:([Zz]oom|onedriver|onedriver-launcher)$"
      "float, class:(org.gnome.Calculator), title:(Calculator)"
      "float, class:^(mpv|com.github.rafostar.Clapper)$"
      "float, class:^([Qq]alculate-gtk)$"
      # "float, class:^([Ww]hatsapp-for-linux|ZapZap|com.rtosta.zapzap)$" # commented out
      "float, class:^([Ff]erdium)$"
      "float, title:^(Picture-in-Picture)$"
      # "float, title:^(Firefox)$" # commented out

      # Float popups and dialogs
      "float, title:^(Authentication Required)$"
      "center, title:^(Authentication Required)$"
      "float, class:(codium|codium-url-handler|VSCodium), title:negative:(.*codium.*|.*VSCodium.*)"
      "float, class:^(com.heroicgameslauncher.hgl)$, title:negative:(Heroic Games Launcher)"
      "float, class:^([Ss]team)$, title:negative:^([Ss]team)$"
      "float, class:([Tt]hunar), title:negative:(.*[Tt]hunar.*)"

      "float, title:^(Add Folder to Workspace)$"
      "size 70% 60%, title:^(Add Folder to Workspace)$"
      "center, title:^(Add Folder to Workspace)$"

      "float, title:^(Save As)$"
      "size 70% 60%, title:^(Save As)$"
      "center, title:^(Save As)$"

      "float, initialTitle:(Open Files)"
      "size 70% 60%, initialTitle:(Open Files)"

      "float, title:^(SDDM Background)$"
      "center, title:^(SDDM Background)$"
      "size 16% 12%, title:^(SDDM Background)$"

      # Opacity rules
      "opacity 0.9 0.7, tag:browser*"
      "opacity 0.9 0.8, tag:projects*"
      "opacity 0.94 0.86, tag:im*"
      "opacity 0.94 0.86, tag:multimedia*"
      "opacity 0.9 0.8, tag:file-manager*"
      "opacity 0.8 0.7, tag:terminal*"
      "opacity 0.8 0.7, tag:settings*"
      "opacity 0.82 0.75, tag:viewer*"
      "opacity 0.9 0.7, tag:wallpaper*"
      "opacity 0.8 0.7, class:^(gedit|org.gnome.TextEditor|mousepad)$"
      "opacity 0.9 0.8, class:^(deluge)$"
      "opacity 0.9 0.8, class:^(im.riot.Riot)$"
      "opacity 0.9 0.8, class:^(seahorse)$"
      "opacity 0.95 0.75, title:^(Picture-in-Picture)$"

      # Size rules
      "size 70% 70%, tag:wallpaper*"
      "size 70% 70%, tag:settings*"
      "size 60% 70%, class:^([Ww]hatsapp-for-linux|ZapZap|com.rtosta.zapzap)$"
      "size 60% 70%, class:^([Ff]erdium)$"

      # Pinning
      "pin, title:^(Picture-in-Picture)$"
      # "pin,title:^(Firefox)$" # commented out

      # Extras
      "keepaspectratio, title:^(Picture-in-Picture)$"

      # Blur & fullscreen
      "noblur, tag:games*"
      "fullscreen, tag:games*"
    ];

    windowrulev2 = [
      "noblur, class:^(Gromit-mpx)$"
      "opacity 1 override, class:^(Gromit-mpx)$"
      "noshadow, class:^(Gromit-mpx)$"
      "size 100% 100%, class:^(Gromit-mpx)$"
    ];
  };
}
