{ ... }:
{
  programs.mpv = {
    enable = true;

    config = {
      "gpu-api" = "vulkan"; # Vulkan Linux, Windows
      # "gpu-api" = "d3d11"; # DirectX on Windows
      # "gpu-api" = "opengl"; # OpenGL on Linux/macOS/Windows

      # Player options
      #"input-ipc-server" = "/tmp/mpvsocket"; # Uncomment if needed
      "hr-seek-framedrop" = "no"; # Disable frame drop on high-res seek
      "no-resume-playback" = true; # Don’t resume playback automatically
      border = false; # Recommended for ModernX OSC
      "msg-color" = true; # Enable colored messages
      "msg-module" = true; # Show module names in messages

      # General options
      #"fullscreen" = true; # Always open in fullscreen
      #"keep-open" = true; # Don’t close player after finishing
      autofit = "85%x85%"; # Start window at 85% screen size
      "cursor-autohide" = 100; # Cursor hide delay in ms

      # Screenshots
      "screenshot-template" = "%x/Screens/Screenshot-%F-T%wH.%wM.%wS.%wT-F%{estimated-frame-number}";
      "screenshot-format" = "png"; # Screenshot format
      "screenshot-png-compression" = 4; # Compression level 0-10
      "screenshot-tag-colorspace" = true; # Tag colorspace
      "screenshot-high-bit-depth" = true; # High bit depth output

      # OSC / OSD
      osc = false; # Disable built-in OSC (needed for ModernX OSC)
      "osd-bar" = true; # Keep for thumbnail script client OSC
      "osd-font" = "Inter Tight Medium"; # Font for OSC
      "osd-font-size" = 30; # Font size
      "osd-color" = "#CCFFFFFF"; # ARGB color
      "osd-border-color" = "#DD322640"; # ARGB border color
      "osd-bar-align-y" = -1; # Progress bar vertical alignment (-1 top)
      "osd-border-size" = 2; # Size of OSD border
      "osd-bar-h" = 1; # Height of OSD bar (fraction of screen height)
      "osd-bar-w" = 60; # Width of OSD bar

      # Subtitles
      "blend-subtitles" = false;
      "sub-ass-vsfilter-blur-compat" = true; # Compatibility for vsfilter fansubs
      "sub-ass-scale-with-window" = false; # Disable scaling subtitles with window
      "sub-auto" = "fuzzy"; # Autoload external subs fuzzily
      #"sub-gauss" = 0.6; # Uncomment if needed for VOB/PGS subs
      "sub-file-paths-append" = [ "ass" "srt" "sub" "subs" "subtitles" ]; # Extra subtitle dirs
      "demuxer-mkv-subtitle-preroll" = true; # Pre-roll embedded subs on seek
      embeddedfonts = true; # Use embedded fonts for SSA/ASS
      "sub-fix-timing" = false; # Don’t fix subtitle timing (enable if scenebleeds)

      # Forced subtitles styling
      "sub-font" = "Open Sans SemiBold";
      "sub-font-size" = 46;
      "sub-blur" = 0.3;
      "sub-border-color" = "0.0/0.0/0.0/0.8";
      "sub-border-size" = 3.2;
      "sub-color" = "0.9/0.9/0.9/1.0";
      "sub-margin-x" = 100;
      "sub-margin-y" = 50;
      "sub-shadow-color" = "0.0/0.0/0.0/0.25";
      "sub-shadow-offset" = 0;

      # Audio
      "volume-max" = 200; # Max volume in %
      "audio-stream-silence" = true; # Fix audio popping on seek
      "audio-file-auto" = "fuzzy"; # Autoload external audio fuzzily
      "audio-pitch-correction" = true; # Use scaletempo for speed changes

      # Language priorities
      alang = "jpn,jp,eng,en,enUS,en-US,de,ger"; # Audio languages
      slang = "eng,en,und,de,ger,jp,jap"; # Subtitle languages

      # Video Profiles
      profile = "high-quality"; # Profile name
      hwdec = "auto-copy"; # Hardware decoding mode
      vo = "gpu-next"; # Video output driver

      # Dither
      "dither-depth" = "auto";

      # Debanding
      deband = true;
      "deband-iterations" = 4;
      "deband-threshold" = 35;
      "deband-range" = 16;
      "deband-grain" = 4;

      # Luma upscaling shaders and scaling
      "glsl-shader" = [
        "~~/shaders/ravu-zoom-ar-r3-rgb.hook" # Good balance perf/quality
        "~~/shaders/CfL_Prediction.glsl"      # Chroma up/down shader
      ];
      scale = "ewa_lanczos";
      "scale-blur" = 0.981251;

      # Luma downscaling
      dscale = "catmull_rom";
      "correct-downscaling" = true;
      "linear-downscaling" = false;

      # Chroma up/downscaling
      cscale = "lanczos";
      "sigmoid-upscaling" = true;

      # Interpolation
      "video-sync" = "display-resample";
      interpolation = true;
      tscale = "sphinx";
      "tscale-blur" = 0.6991556596428412;
      "tscale-radius" = 1.05;
      "tscale-clamp" = 0.0;

      # SDR/HDR
      "tone-mapping" = "bt.2446a";
      "target-colorspace-hint" = true;

      # Playback
      deinterlace = false; # Disable deinterlacing globally
    };

    profiles = {
      default = {};
      "protocol.http" = {
        "hls-bitrate" = "max"; # Max quality for HLS streams
        cache = true;
        "no-cache-pause" = true; # Don’t pause on low cache
      };
      "protocol.https" = {
        profile = "protocol.http";
      };
      "protocol.ytdl" = {
        profile = "protocol.http";
      };
    };

    bindings = {
      # Volume controls
      WHEEL_UP = "add volume 2";          # Scroll wheel up increases volume by 2%
      WHEEL_DOWN = "add volume -2";       # Scroll wheel down decreases volume by 2%
      UP = "add volume 2";                 # Arrow up increases volume
      DOWN = "add volume -2";              # Arrow down decreases volume
      AXIS_UP = "add volume 2";            # Joystick axis up increases volume
      AXIS_DOWN = "add volume -2";         # Joystick axis down decreases volume

      # Seeking
      "Ctrl+RIGHT" = "seek 85 exact";     # Ctrl + right arrow seeks forward 85 seconds
      "Ctrl+LEFT" = "seek -85 exact";     # Ctrl + left arrow seeks backward 85 seconds

      # Frame stepping
      "Shift+RIGHT" = "frame-step";       # Shift + right arrow steps forward one frame
      "Shift+LEFT" = "frame-back-step";   # Shift + left arrow steps backward one frame

      # Quick seeks
      H = "seek -65";                     # H key seeks backward 65 seconds
      h = "seek 65";                      # h key seeks forward 65 seconds

      # Toggle options
      v = "cycle deband";                 # Toggle debanding filter
      a = "cycle audio";                  # Cycle audio tracks
      s = "cycle sub";                    # Cycle subtitles
      i = "cycle interpolation";         # Toggle interpolation

      # Script messages
      t = "script-message-to seek_to toggle-seeker"; # Custom script message
      F = "script-binding quality_menu/video_formats_toggle";
      "Alt+f" = "script-binding quality_menu/audio_formats_toggle";
      "Ctrl+r" = "script-binding quality_menu/reload";

      # Mac integration scripts
      "Meta+v" = "script-message-to Mac_Integration OpenFromClipboard";
      TAB = "script-message-to Mac_Integration ShowFinder";
      "Ctrl+f" = "script-message-to Mac_Integration ShowInFinder";

      # Zoom controls
      "-" = "add video-zoom -0.25";      # Zoom out by 0.25
      "+" = "add video-zoom 0.25";       # Zoom in by 0.25

      # Video panning
      kp8 = "add video-pan-y 0.05";      # Numpad 8 pan up
      kp6 = "add video-pan-x -0.05";     # Numpad 6 pan left
      kp2 = "add video-pan-y -0.05";     # Numpad 2 pan down
      kp4 = "add video-pan-x 0.05";      # Numpad 4 pan right

      kp5 = "set video-pan-x 0; set video-pan-y 0; set video-zoom 0"; # Reset pan and zoom

      # Playlist toggle (modernx.lua)
      p = "script-binding modernx_toggle_playlist";
    };
  };
}