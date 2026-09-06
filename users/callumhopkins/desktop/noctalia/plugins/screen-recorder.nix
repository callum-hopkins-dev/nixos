{ pkgs, ... }:

{
  home.packages = [ pkgs.gpu-screen-recorder ];

  programs.noctalia.settings.plugins.enabled = [
    "noctalia/screen_recorder"
  ];
}
