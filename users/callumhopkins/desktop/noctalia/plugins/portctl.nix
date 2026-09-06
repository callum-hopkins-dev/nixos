{ pkgs, ... }:

{
  home.packages = [ pkgs.iproute2 ];

  programs.noctalia.settings.plugins.enabled = [
    "rxtsel/portctl"
  ];
}
