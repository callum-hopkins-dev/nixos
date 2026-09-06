{ pkgs, ... }:

{
  home.packages = [ pkgs.proton-pass-cli ];

  programs.noctalia.settings.plugins.enabled = [
    "proton-pass"
  ];
}
