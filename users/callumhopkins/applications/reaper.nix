{ pkgs, ... }:

{
  home.packages = [
    pkgs.reaper
    pkgs.sfizz-ui
  ];
}
