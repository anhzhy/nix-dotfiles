{ ... }:
{
  wayland.windowManager.hyprland.settings = {
    windowrule = [
      # --- Browser ---
      "match:class ^([Ff]irefox|org.mozilla.firefox|[Ff]irefox-esr|[Ff]irefox-bin)$, tag +browser"
      "match:class ^([Gg]oogle-chrome(-beta|-dev|-unstable)?)$, tag +browser"
      "match:class ^(chrome-.+-Default)$, tag +browser"
      "match:class ^([Cc]hromium)$, tag +browser"
      "match:class ^([Mm]icrosoft-edge(-stable|-beta|-dev|-unstable))$, tag +browser"
      "match:class ^(Brave-browser(-beta|-dev|-unstable)?)$, tag +browser"
      "match:class ^([Tt]horium-browser|[Cc]achy-browser)$, tag +browser"
      "match:class ^(zen-beta|zen)$, tag +browser"

      # --- Email ---
      "match:class ^([Tt]hunderbird|org.gnome.Evolution)$, tag +email"
      "match:class ^(eu.betterbird.Betterbird)$, tag +email"

      # --- IDE ---
      "match:class ^(codium|codium-url-handler|VSCodium)$, tag +projects"
      "match:class ^(VSCode|code-url-handler)$, tag +projects"
      "match:class ^(jetbrains-.+)$, tag +projects"

      # --- Screen Sharing ---
      "match:class ^(com.obsproject.Studio)$, tag +screenshare"

      # --- IM ---
      "match:class ^([Dd]iscord|[Ww]ebCord|[Vv]esktop)$, tag +im"
      "match:class ^([Ff]erdium)$, tag +im"
      "match:class ^([Ww]hatsapp-for-linux)$, tag +im"
      "match:class ^(ZapZap|com.rtosta.zapzap)$, tag +im"
      "match:class ^(org.telegram.desktop|io.github.tdesktop_x64.TDesktop)$, tag +im"
      "match:class ^(teams-for-linux)$, tag +im"
      "match:class ^(im.riot.Riot|Element)$ # Element Matrix client, tag +im"

      # --- Games ---
      "match:class ^(gamescope)$, tag +games"
      "match:class ^(steam_app_\\d+)$, tag +games"

      # --- Game Store ---
      "match:class ^([Ss]team)$, tag +gamestore"
      "match:title ^([Ll]utris)$, tag +gamestore"
      "match:class ^(com.heroicgameslauncher.hgl)$, tag +gamestore"

      # --- File Manager ---
      "match:class ^([Tt]hunar|org.gnome.Nautilus|[Pp]cmanfm-qt)$, tag +file-manager"
      "match:class ^(app.drey.Warp)$, tag +file-manager"

      # --- Wallpaper ---
      "match:class ^([Ww]aytrogen)$, tag +wallpaper"

      # --- Multimedia ---
      "match:class ^([Aa]udacious)$, tag +multimedia"

      # --- Multimedia-video ---
      "match:class ^([Mm]pv|vlc)$, tag +multimedia_video"

      # --- Settings ---
      "match:title ^(ROG Control)$, tag +settings"
      "match:class ^(wihotspot(-gui)?)$, tag +settings"
      "match:class ^([Bb]aobab|org.gnome.[Bb]aobab)$, tag +settings"
      "match:class ^(gnome-disks)$, tag +settings"
      "match:title (Kvantum Manager), tag +settings"
      "match:class ^(file-roller|org.gnome.FileRoller)$, tag +settings"
      "match:class ^(nm-applet|nm-connection-editor|blueman-manager)$, tag +settings"
      "match:class ^(pavucontrol|org.pulseaudio.pavucontrol|com.saivert.pwvucontrol)$, tag +settings"
      "match:class ^(qt5ct|qt6ct|[Yy]ad)$, tag +settings"
      "match:class (xdg-desktop-portal-gtk), tag +settings"
      "match:class ^(org.kde.polkit-kde-authentication-agent-1)$, tag +settings"
      "match:class ^([Rr]ofi)$, tag +settings"

      # --- Viewer ---
      "match:class ^(gnome-system-monitor|org.gnome.SystemMonitor|io.missioncenter.MissionCenter)$, tag +viewer"
      "match:class ^(evince)$, tag +viewer"
      "match:class ^(eog|org.gnome.Loupe|viewnior)$, tag +viewer"

      # --- Special ---
      "match:tag multimedia_video*, no_blur on"
      "match:tag multimedia_video*, opacity 1.0"

      # --- Positioning ---
      "match:class ([Tt]hunar) title negative:(.*[Tt]hunar.*), center on"
      "match:title ^(ROG Control)$, center on"
      "match:title ^(Keybindings)$, center on"
      "match:class ^(pavucontrol|org.pulseaudio.pavucontrol|com.saivert.pwvucontrol)$, center on"
      "match:class ^([Ww]hatsapp-for-linux|ZapZap|com.rtosta.zapzap)$, center on"
      "match:class ^([Ff]erdium)$, center on"
      "match:title ^(Picture-in-Picture)$, move 72% 7%"

      # Idle inhibit for fullscreen
      "match:fullscreen 1, idle_inhibit fullscreen"

      # Move to workspace
      "match:tag email*, workspace 1"
      "match:tag browser*, workspace 2"
      "match:tag gamestore*, workspace 5"
      "match:tag im*, workspace 7"
      "match:tag games*, workspace 8"

      # Move to workspace silently
      # "match:tag screenshare*, workspace 4 silent"
      # "match:class ^(virt-manager)$, workspace 6 silent"
      # "match:class ^(.virt-manager-wrapped)$, workspace 6 silent"
      # "match:tag multimedia*, workspace 9 silent"

      # Floating windows
      "match:tag wallpaper*, float on"
      "match:tag settings*, float on"
      "match:tag viewer*, float on"
      "match:class ([Zz]oom|onedriver|onedriver-launcher)$, float on"
      "match:class (org.gnome.Calculator) title (Calculator), float on"
      "match:class ^(mpv|com.github.rafostar.Clapper)$, float on"
      "match:class ^([Qq]alculate-gtk)$, float on"
      "match:class ^([Ff]erdium)$, float on"
      "match:title ^(Picture-in-Picture)$, float on"

      # Float popups and dialogs
      "match:title ^(Authentication Required)$, float on"
      "match:title ^(Authentication Required)$, center on"
      "match:class (codium|codium-url-handler|VSCodium) title negative:(.*codium.*|.*VSCodium.*), float on"
      "match:class ^(com.heroicgameslauncher.hgl)$ title negative:(Heroic Games Launcher), float on"
      "match:class ^([Ss]team)$ title negative:^([Ss]team)$, float on"
      "match:class ([Tt]hunar) title negative:(.*[Tt]hunar.*), float on"

      "match:title ^(Add Folder to Workspace)$, float on"
      "match:title ^(Add Folder to Workspace)$, size 70% 60%"
      "match:title ^(Add Folder to Workspace)$, center on"

      "match:title ^(Save As)$, float on"
      "match:title ^(Save As)$, size 70% 60%"
      "match:title ^(Save As)$, center on"

      "match:initial_title (Open Files), float on"
      "match:initial_title (Open Files), size 70% 60%"

      "match:title ^(SDDM Background)$, float on"
      "match:title ^(SDDM Background)$, center on"
      "match:title ^(SDDM Background)$, size 16% 12%"

      # Opacity rules
      "match:tag browser*, opacity 0.9 0.7"
      "match:tag projects*, opacity 0.9 0.8"
      "match:tag im*, opacity 0.94 0.86"
      "match:tag multimedia*, opacity 0.94 0.86"
      "match:tag file-manager*, opacity 0.9 0.8"
      "match:tag terminal*, opacity 0.8 0.7"
      "match:tag settings*, opacity 0.8 0.7"
      "match:tag viewer*, opacity 0.82 0.75"
      "match:tag wallpaper*, opacity 0.9 0.7"
      "match:title ^(Picture-in-Picture)$, opacity 0.95 0.75"

      # Size rules
      "match:tag wallpaper*, size 70% 70%"
      "match:tag settings*, size 70% 70%"
      "match:class ^([Ww]hatsapp-for-linux|ZapZap|com.rtosta.zapzap)$, size 60% 70%"
      "match:class ^([Ff]erdium)$, size 60% 70%"

      # Pinning
      "match:title ^(Picture-in-Picture)$, pin on"

      # Extras
      "match:title ^(Picture-in-Picture)$, keep_aspect_ratio on"

      # Blur & fullscreen
      "match:tag games*, no_blur on"
      "match:tag games*, fullscreen on"

      "no_blur on, match:class ^(Gromit-mpx)$"
      "opacity 1 override, match:class ^(Gromit-mpx)$"
      "no_shadow on, match:class ^(Gromit-mpx)$"
      "size 100% 100%, match:class ^(Gromit-mpx)$"
    ];

    # windowrulev2 = [
    #   "noblur, class:^(Gromit-mpx)$"
    #   "opacity 1 override, class:^(Gromit-mpx)$"
    #   "noshadow, class:^(Gromit-mpx)$"
    #   "size 100% 100%, class:^(Gromit-mpx)$"
    # ];
  };
}
