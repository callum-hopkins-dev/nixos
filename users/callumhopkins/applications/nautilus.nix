{ pkgs, lib, ... }:

{
  home.packages = [
    pkgs.nautilus
    pkgs.adwaita-icon-theme
  ];

  dconf.settings = {
    "org/gnome/desktop/privacy" = {
      remember-recent-files = false;
      recent-files-max-age = 0;

      remove-old-trash-files = true;
      old-files-age = lib.hm.gvariant.mkUint32 7;
    };
  };
}
