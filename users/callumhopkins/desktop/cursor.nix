{ config, pkgs, ... }:

{
  home.packages = [ pkgs.hyprcursor ];

  home.pointerCursor = {
    enable = true;

    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Classic";
    size = 24;

    hyprcursor = {
      enable = true;
      size = config.home.pointerCursor.size;
    };

    gtk.enable = true;
    x11.enable = true;
  };
}
