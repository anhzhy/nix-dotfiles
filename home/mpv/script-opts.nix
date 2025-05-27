{ ... }:
{
  programs.mpv = {
    scriptOpts = {
      # Playlist manager options (example from previous)
      playlistmanager = {
        dynamic_binds = "yes";
        key_moveup = "UP";
        key_movedown = "DOWN";
        key_selectfile = "RIGHT LEFT";
        key_unselectfile = "";
        key_playfile = "ENTER";
        key_removefile = "BS";
        key_closeplaylist = "ESC";
        filename_replace = "";
        loadfiles_filetypes = [
          "jpg" "jpeg" "png" "tif" "tiff" "gif" "webp" "svg" "bmp"
          "mp3" "wav" "ogm" "flac" "m4a" "wma" "ogg" "opus" "mkv"
          "avi" "mp4" "ogv" "webm" "rmvb" "flv" "wmv" "mpeg" "mpg"
          "m4v" "3gp"
        ];
        loadfiles_on_start = "no";
        sortplaylist_on_start = "no";
        sortplaylist_on_file_add = "no";
        alphanumsort = "yes";
        system = "auto";
        playlist_savepath = "";
        save_playlist_on_file_end = "no";
        show_playlist_on_fileload = "0";
        sync_cursor_on_load = "yes";
        open_toggles = "yes";
        loop_cursor = "yes";
        prefer_titles = "url";
        resolve_titles = "no";
        playlist_display_timeout = "10";
        showamount = "20";
        scale_playlist_by_window = "yes";
        style_ass_tags = "{\\fnInter Tight Medium\\fs8\\bord0.8}";
        text_padding_x = "10";
        text_padding_y = "30";
        set_title_stripped = "no";
        title_prefix = "";
        title_suffix = " - mpv";
        slice_longfilenames = "no";
        slice_longfilenames_amount = "70";
        playlist_header = "[%cursor/%plen]";
        normal_file = "○ %name";
        hovered_file = "● %name";
        selected_file = "➔ %name";
        playing_file = "▷ %name";
        playing_hovered_file = "▶ %name";
        playing_selected_file = "➤ %name";
        playlist_sliced_prefix = "...";
        playlist_sliced_suffix = "...";
      };

      # Quality menu / youtube-dl options
      quality-menu = {
        # Key bindings for quality menu navigation
        up_binding = "UP WHEEL_UP";
        down_binding = "DOWN WHEEL_DOWN";
        select_binding = "ENTER MBTN_LEFT";
        close_menu_binding = "ESC MBTN_RIGHT F Alt+f";

        ytdl_ver = "yt-dlp";

        selected_and_active = "▶  - ";
        selected_and_inactive = "●  - ";
        unselected_and_active = "▷ - ";
        unselected_and_inactive = "○ - ";

        scale_playlist_by_window = "yes";

        style_ass_tags = "{\\fnmonospace\\fs25\\bord1}";

        shift_x = "0";
        shift_y = "0";

        text_padding_x = "5";
        text_padding_y = "10";

        curtain_opacity = "0.7";

        menu_timeout = "6";

        fetch_formats = "yes";

        quality_strings = [
          { "4320p" = "bestvideo[height<=?4320p]+bestaudio/best"; }
          { "2160p" = "bestvideo[height<=?2160]+bestaudio/best"; }
          { "1440p" = "bestvideo[height<=?1440]+bestaudio/best"; }
          { "1080p" = "bestvideo[height<=?1080]+bestaudio/best"; }
          { "720p" = "bestvideo[height<=?720]+bestaudio/best"; }
          { "480p" = "bestvideo[height<=?480]+bestaudio/best"; }
          { "360p" = "bestvideo[height<=?360]+bestaudio/best"; }
          { "240p" = "bestvideo[height<=?240]+bestaudio/best"; }
          { "144p" = "bestvideo[height<=?144]+bestaudio/best"; }
        ];

        reset_format = "yes";
        fetch_on_start = "yes";
        start_with_menu = "no";
        include_unknown = "no";
        hide_identical_columns = "yes";

        columns_video = "-resolution,frame_rate,dynamic_range,language,bitrate_total,size,-codec_video,-codec_audio";
        columns_audio = "audio_sample_rate,bitrate_total,size,language,-codec_audio";

        sort_video = "height,fps,tbr,size,format_id";
        sort_audio = "asr,tbr,size,format_id";
      };

      # Stats script options (for stats.conf)
      stats = {
        duration = "10";
        persistent_overlay = "yes";
        filter_params_max_length = "0";

        plot_perfdata = "no";
        plot_vsync_ratio = "no";
        plot_vsync_jitter = "no";

        font = "Inter Tight Medium";
        font_mono = "JetBrains Mono";
        font_size = "5.5";
        font_color = "fafafa";
        border_size = "0.6";
        border_color = "000000";
        alpha = "11";
      };
    };
  };
}