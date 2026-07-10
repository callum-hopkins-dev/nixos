{
  pkgs,
  config,
  lib,
  ...
}:

{
  options.services.xserver.output = lib.mkOption {
    type = lib.types.nullOr (
      lib.types.submodule {
        options = {
          name = lib.mkOption {
            type = lib.types.str;
            example = "HDMI-A-1";
            description = "Display output name.";
          };

          mode = lib.mkOption {
            type = lib.types.submodule {
              options = {
                width = lib.mkOption {
                  type = lib.types.ints.positive;
                  example = 2560;
                  description = "Display mode width in physical pixels.";
                };

                height = lib.mkOption {
                  type = lib.types.ints.positive;
                  example = 1440;
                  description = "Display mode height in physical pixels.";
                };

                framerate = lib.mkOption {
                  type = lib.types.numbers.positive;
                  example = 59.951;
                  description = "Display refresh rate in Hz.";
                };
              };
            };

            description = "Display mode.";
          };

          scale = lib.mkOption {
            type = lib.types.nullOr lib.types.numbers.positive;
            default = null;
            example = 1;
            description = "Logical display scale.";
          };
        };
      }
    );

    default = null;
    description = "Declarative configuration for the primary display output.";

    example = {
      name = "HDMI-A-1";

      mode = {
        width = 2560;
        height = 1440;
        framerate = 59.951;
      };

      scale = 1;
    };
  };

  config = {
    programs.niri.enable = true;

    xdg.portal = {
      enable = true;

      extraPortals = [
        pkgs.xdg-desktop-portal-gnome
        pkgs.xdg-desktop-portal-wlr
      ];

      config.common.default = "gnome";
    };

    environment.etc."niri/outputs.kdl".text = lib.mkIf (config.services.xserver.output != null) (
      let
        output = config.services.xserver.output;
      in
      ''
        output "${output.name}" {
          mode "${toString output.mode.width}x${toString output.mode.height}@${toString output.mode.framerate}"

          ${lib.optionalString (output.scale != null) "scale ${toString output.scale}"}

          focus-at-startup
        }
      ''
    );
  };
}
