{
  inputs,
  config,
  pkgs,
  ...
}:

{
  imports = [
    inputs.stylix.homeModules.stylix
  ];

  home.packages = [ pkgs.base16-schemes ];

  stylix = {
    enable = true;

    overlays.enable = false;

    fonts = {
      serif = config.stylix.fonts.monospace;
      sansSerif = config.stylix.fonts.monospace;
      emoji = config.stylix.fonts.monospace;

      monospace = {
        package = pkgs.jetbrains-mono;
        name = "JetBrainsMono";
      };
    };

    opacity = {
      desktop = 0.75;
      terminal = 0.75;
      popups = 0.75;
    };

    base16Scheme = "${pkgs.base16-schemes}/share/themes/tomorrow-night.yaml";

    # colorGeneration = {
    #   polarity = "dark";
    #   scheme = "tonal-spot";
    # };

    # image = ../assets/wallpaper.jpg;

    # override = {
    #   base02 = "ffffff";
    # };
  };
}
