{ pkgs, ... }:

{
  home.packages = [
    pkgs.reaper
    pkgs.sfizz-ui
  ];

  home.file.".vst3/sfizz.vst3".source = "${pkgs.sfizz-ui}/lib/vst3/sfizz.vst3";

}
