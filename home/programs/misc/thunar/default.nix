{ pkgs, username, ... }:
{
  home.packages = with pkgs; [
    xfce.thunar
    xfce.xfconf
    xfce.tumbler
    xfce.thunar-archive-plugin
    xfce.thunar-volman
    xfce.thunar-media-tags-plugin
    p7zip
    unzip
    zip
    unrar
    xarchiver
  ];

  gtk.gtk3.bookmarks = [
    "file:///home/${username}/Documents Documents"
    "file:///home/${username}/Downloads Downloads"
    "file:///home/${username}/Music Music"
    "file:///home/${username}/nix-dotfiles Dotfiles"
    "file:///home/${username}/Pictures Pictures"
    "file:///home/${username}/Videos Videos"
    "file:///home/${username}/Workspace Workspace"
  ];

  xdg.configFile."xarchiver/xarchiverrc".text = ''
    [xarchiver]
    preferred_format=0
    prefer_unzip=true
    confirm_deletion=true
    sort_filename_content=false
    advanced_isearch=true
    auto_expand=true
    store_output=false
    icon_size=2
    show_archive_comment=false
    show_sidebar=true
    show_location_bar=true
    show_toolbar=true
    preferred_custom_cmd=
    preferred_temp_dir=/tmp
    preferred_extract_dir=/home/${username}/Downloads
    allow_sub_dir=0
    ensure_directory=true
    overwrite=false
    full_path=2
    touch=false
    fresh=false
    update=false
    store_path=false
    updadd=true
    freshen=false
    recurse=true
    solid_archive=false
    remove_files=false
  '';

  xdg.configFile."xfce4/helpers.rc".text = ''
    TerminalEmulator=kitty
  '';
}
