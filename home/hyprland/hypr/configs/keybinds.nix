{ ... }:
let
  main = "SUPER";
  terminal = "kitty";
  files = "thunar";
  scripts = "$HOME/.config/hypr/scripts";
in
{
  wayland.windowManager.hyprland.settings = {
    bind = [
      # --- System ---
      "CTRL ALT, Delete, exec, hyprctl dispatch exit 0"
      "${main}, Q, killactive"
      "${main} SHIFT, Q, exec, ${scripts}/KillActiveProcess.sh"
      "CTRL ALT, L, exec, ${scripts}/LockScreen.sh"
      "CTRL ALT, P, exec, ${scripts}/Wlogout.sh"
      "${main} SHIFT, W, exec, ${scripts}/AirplaneMode.sh"

      # Common
      "${main}, Return, exec, ${terminal}"
      "${main}, E, exec, ${files}"
      "${main}, B, exec, xdg-open 'https://'"
      "${main}, D, exec, pgrep -x rofi > /dev/null && pkill rofi || rofi -show drun -modi drun,filebrowser,run,window"

      # Features
      "${main}, F, fullscreen"
      "${main} SHIFT, F, fullscreen, 1"
      "${main}, SPACE, togglefloating"
      "${main} ALT, SPACE, exec, hyprctl dispatch workspaceopt allfloat"
      "${main} SHIFT, Return, exec, [float; move 15% 5%; size 70% 60%] ${terminal}"

      "${main} ALT, mouse_down, exec, hyprctl keyword cursor:zoom_factor '$(hyprctl getoption cursor:zoom_factor | awk 'NR==1 {factor = $2; if (factor < 1) {factor = 1}; print factor * 2.0}')'"
      "${main} ALT, mouse_up, exec, hyprctl keyword cursor:zoom_factor '$(hyprctl getoption cursor:zoom_factor | awk 'NR==1 {factor = $2; if (factor < 1) {factor = 1}; print factor / 2.0}')'"

      "${main} CTRL ALT, B, exec, pkill -SIGUSR1 waybar"
      "${main} ALT, B, exec, ${scripts}/ChangeBlur.sh"
      "${main} SHIFT, G, exec, ${scripts}/GameMode.sh"
      "${main} SHIFT, D, exec, ${scripts}/DarkLight.sh"
      "${main}, W, exec, ${scripts}/WallpaperSelect.sh"

      ", PRINT, exec, ${scripts}/ScreenShot.sh --now"
      "CTRL, PRINT, exec, ${scripts}/ScreenShot.sh --area"
      "ALT, PRINT, exec, ${scripts}/ScreenShot.sh --active"
      "${main} SHIFT, S, exec, ${scripts}/ScreenShot.sh --swappy"

      # --- Window ---
      # Move windows
      "${main} CTRL, left, movewindow, l"
      "${main} CTRL, right, movewindow, r"
      "${main} CTRL, up, movewindow, u"
      "${main} CTRL, down, movewindow, d"

      # Swap windows
      "${main} ALT, left, swapwindow, l"
      "${main} ALT, right, swapwindow, r"
      "${main} ALT, up, swapwindow, u"
      "${main} ALT, down, swapwindow, d"

      # Move focus with SUPER + arrow keys
      "${main}, left, movefocus, l"
      "${main}, right, movefocus, r"
      "${main}, up, movefocus, u"
      "${main}, down, movefocus, d"

      # --- Layout ---
      # Master
      "${main} CTRL, D, layoutmsg, removemaster"
      "${main}, I, layoutmsg, addmaster"
      "${main}, J, layoutmsg, cyclenext"
      "${main}, K, layoutmsg, cycleprev"
      "${main} CTRL, Return, layoutmsg, swapwithmaster"

      # Dwindle
      "${main} SHIFT, I, togglesplit"
      "${main}, P, pseudo,"

      # Works on either (Master or Dwindle)
      "${main}, M, exec, hyprctl dispatch splitratio 0.3"

      # Group
      "${main}, G, togglegroup"
      "${main} CTRL, tab, changegroupactive"

      # --- Workspace ---
      # Switch workspace
      "${main}, tab, workspace, m+1"

      # Special workspace
      "${main} SHIFT, U, movetoworkspace, special"
      "${main}, U, togglespecialworkspace,"

      # Switch workspaces with SUPER + [0-9] using key codes
      "${main}, code:10, workspace, 1" # key 1
      "${main}, code:11, workspace, 2" # key 2
      "${main}, code:12, workspace, 3" # key 3
      "${main}, code:13, workspace, 4" # key 4
      "${main}, code:14, workspace, 5" # key 5
      "${main}, code:15, workspace, 6" # key 6
      "${main}, code:16, workspace, 7" # key 7
      "${main}, code:17, workspace, 8" # key 8
      "${main}, code:18, workspace, 9" # key 9
      "${main}, code:19, workspace, 10" # key 0

      # Move active window and follow to workspace with SUPER + SHIFT + [0-9]
      "${main} SHIFT, code:10, movetoworkspace, 1"
      "${main} SHIFT, code:11, movetoworkspace, 2"
      "${main} SHIFT, code:12, movetoworkspace, 3"
      "${main} SHIFT, code:13, movetoworkspace, 4"
      "${main} SHIFT, code:14, movetoworkspace, 5"
      "${main} SHIFT, code:15, movetoworkspace, 6"
      "${main} SHIFT, code:16, movetoworkspace, 7"
      "${main} SHIFT, code:17, movetoworkspace, 8"
      "${main} SHIFT, code:18, movetoworkspace, 9"
      "${main} SHIFT, code:19, movetoworkspace, 10"
      "${main} SHIFT, bracketleft, movetoworkspace, -1"
      "${main} SHIFT, bracketright, movetoworkspace, +1"

      # Move active window to workspace silently with SUPER + CTRL + [0-9]
      "${main} CTRL, code:10, movetoworkspacesilent, 1"
      "${main} CTRL, code:11, movetoworkspacesilent, 2"
      "${main} CTRL, code:12, movetoworkspacesilent, 3"
      "${main} CTRL, code:13, movetoworkspacesilent, 4"
      "${main} CTRL, code:14, movetoworkspacesilent, 5"
      "${main} CTRL, code:15, movetoworkspacesilent, 6"
      "${main} CTRL, code:16, movetoworkspacesilent, 7"
      "${main} CTRL, code:17, movetoworkspacesilent, 8"
      "${main} CTRL, code:18, movetoworkspacesilent, 9"
      "${main} CTRL, code:19, movetoworkspacesilent, 10"
      "${main} CTRL, bracketleft, movetoworkspacesilent, -1"
      "${main} CTRL, bracketright, movetoworkspacesilent, +1"

      # Scroll through existing workspaces with SUPER + scroll
      "${main}, mouse_down, workspace, e+1"
      "${main}, mouse_up, workspace, e-1"
      "${main}, period, workspace, e+1"
      "${main}, comma, workspace, e-1"
    ];

    binde = [
      "${main} SHIFT, left, resizeactive,-50 0"
      "${main} SHIFT, right, resizeactive,50 0"
      "${main} SHIFT, up, resizeactive,0 -50"
      "${main} SHIFT, down, resizeactive,0 50"

      ", xf86KbdBrightnessDown, exec, ${scripts}/BrightnessKbd.sh --dec"
      ", xf86KbdBrightnessUp, exec, ${scripts}/BrightnessKbd.sh --inc"
      ", xf86MonBrightnessDown, exec, ${scripts}/Brightness.sh --dec"
      ", xf86MonBrightnessUp, exec, ${scripts}/Brightness.sh --inc "
    ];

    bindm = [
      "${main}, mouse:272, movewindow"
      "${main}, mouse:273, resizewindow"
    ];

    bindl = [
      ", xf86AudioMicMute, exec, ${scripts}/Volume.sh --toggle-mic"
      ", xf86audiomute, exec, ${scripts}/Volume.sh --toggle"
      ", XF86Sleep, exec, systemctl suspend"
      ", XF86RFKill, exec, ${scripts}/AirplaneMode.sh"
      ", XF86AudioPlayPause, exec, ${scripts}/MediaCtrl.sh --pause"
      ", XF86AudioPause, exec, ${scripts}/MediaCtrl.sh --pause"
      ", XF86AudioPlay, exec, ${scripts}/MediaCtrl.sh --pause"
      ", XF86AudioNext, exec, ${scripts}/MediaCtrl.sh --nxt"
      ", XF86AudioPrev, exec, ${scripts}/MediaCtrl.sh --prv"
      ", XF86AudioStop, exec, ${scripts}/MediaCtrl.sh --stop"
    ];

    bindel = [
      ", xf86audioraisevolume, exec, ${scripts}/Volume.sh --inc"
      ", xf86audiolowervolume, exec, ${scripts}/Volume.sh --dec"
    ];

    binds = {
      workspace_back_and_forth = true;
      allow_workspace_cycles = true;
      pass_mouse_when_bound = false;
    };
  };
}
