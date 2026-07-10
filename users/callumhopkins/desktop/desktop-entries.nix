{ lib, config, ... }:

{
  options.xdg.hiddenEntries = lib.mkOption {
    type = lib.types.listOf lib.types.str;
    default = [ ];
    description = "List of desktop entry names to hide from application menus.";
  };

  config = {
    xdg.desktopEntries = lib.mkIf (config.xdg.hiddenEntries != [ ]) (
      lib.genAttrs config.xdg.hiddenEntries (name: {
        inherit name;
        noDisplay = true;
      })
    );

    xdg.hiddenEntries = [
      "nvidia-settings"
      "cups"
      "kitty"
      "nixos-manual"
      "Helix"
      "qt5ct"
      "qt6ct"
      "bottom"
      "kvantummanager"
      "dev.noctalia.Noctalia"
    ];
  };
}
