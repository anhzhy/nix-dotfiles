{ pkgs, ... }:
{
  xdg.configFile."wlogout/icons".source = ./icons;
  programs.wlogout = {
    enable = true;
    layout = [
      {
        label = "lock";
        action = "loginctl lock-session";
        text = "Lock";
        keybind = "l";
      }
      {
        label = "hibernate";
        action = "systemctl hibernate";
        text = "Hibernate";
        keybind = "h";
      }
      {
        label = "logout";
        action = "hyprctl dispatch exit 0";
        text = "Exit";
        keybind = "e";
      }
      {
        label = "shutdown";
        action = "systemctl poweroff";
        text = "Shutdown";
        keybind = "s";
      }
      {
        label = "suspend";
        action = "systemctl suspend";
        text = "Suspend";
        keybind = "u";
      }
      {
        label = "reboot";
        action = "systemctl reboot";
        text = "Reboot";
        keybind = "r";
      }
    ];

    style = ''
      @import "colors.css";

      * {
        background-image: none;
      }

      window {
          font-family: Maple Mono;
          font-size: 14pt;
          color: @on_background;
          /* text */
          background-color: @surface-alpha;
      }

      button { 
          background-repeat: no-repeat;
          background-position: center;
          background-size: 25%;
          border: none;
          background-color: transparent;
          margin: 5px;
          border-radius: 80px;
          outline-style: none;
          animation: gradient_f 10s ease-in infinite;
          transition: all 0.3s cubic-bezier(.55, 0.0, .28, 1.682), box-shadow 0.2s ease-in-out, background-color 0.2s ease-in-out;
      }

      button:hover {
          background-color: @primary;
          color: @primary_container;
      }

      button:focus {
          background-color: @primary;
          color: @secondary_container;
          box-shadow: none;
      }

      #lock {
          background-image: image(url("./icons/lock_white.png"));
      }

      #lock:hover {
          background-image: image(url("./icons/lock_black.png"));
      }

      #logout {
          background-image: image(url("./icons/logout_white.png"));
      }

      #logout:hover {
          background-image: image(url("./icons/logout_black.png"));
      }

      #suspend {
          background-image: image(url("./icons/suspend_white.png"));
      }

      #suspend:hover {
          background-image: image(url("./icons/suspend_black.png"));
      }

      #shutdown {
          background-image: image(url("./icons/shutdown_white.png"));
      }

      #shutdown:hover {
          background-image: image(url("./icons/shutdown_black.png"));
      }

      #reboot {
          background-image: image(url("./icons/reboot_white.png"));
      }

      #reboot:hover {
          background-image: image(url("./icons/reboot_black.png"));
      }

      #hibernate {
          background-image: image(url("./icons/hibernate_white.png"));
      }

      #hibernate:hover {
          background-image: image(url("./icons/hibernate_black.png"));
      }
    '';
  };

  home.packages = with pkgs; [ wlogout ];
}
