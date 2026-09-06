{ pkgs, ... }:

{
  home.packages = [ pkgs.fzf ];

  programs.noctalia.settings.plugins.enabled = [
    "nightwatch75/file-search"
  ];
}
