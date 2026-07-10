{ inputs, pkgs, ... }:

{
  imports = [
    inputs.home-manager.nixosModules.home-manager
  ];

  home-manager = {
    backupFileExtension = "backup";
    useGlobalPkgs = true;
    useUserPackages = true;

    extraSpecialArgs = { inherit inputs; };

    sharedModules = [
      (
        { config, lib, ... }:
        {
          options.home = {
            avatar = lib.mkOption {
              type = lib.types.nullOr lib.types.path;
              default = null;
              description = "Path to the user's avatar image.";
            };

            wallpapers = lib.mkOption {
              type = lib.types.listOf lib.types.path;
              default = [ ];
              description = "Paths to the user's wallpaper images.";
            };
          };

          config = lib.mkMerge [
            (lib.mkIf (config.home.avatar != null) {
              home.file.".face".source = config.home.avatar;

              home.activation.setAccountsServiceAvatar = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
                if ! ${pkgs.systemd}/bin/busctl --system --quiet status org.freedesktop.Accounts >/dev/null 2>&1; then
                  echo "AccountsService is not running; skipping avatar update"
                  exit 0
                fi

                user_path="$(${pkgs.systemd}/bin/busctl --json=short call --system \
                  org.freedesktop.Accounts \
                  /org/freedesktop/Accounts \
                  org.freedesktop.Accounts \
                  FindUserByName s "$USER" | ${pkgs.jq}/bin/jq -r '.data[0]')" || {
                    echo "Could not query AccountsService; skipping avatar update"
                    exit 0
                  }

                ${pkgs.systemd}/bin/busctl call --system \
                  org.freedesktop.Accounts \
                  "$user_path" \
                  org.freedesktop.Accounts.User \
                  SetIconFile s "${config.home.avatar}" || \
                  echo "Could not set AccountsService avatar; skipping"
              '';
            })

            (lib.mkIf (config.home.wallpapers != [ ]) {
              xdg.dataFile = builtins.listToAttrs (
                map (wallpaper: {
                  name = "wallpapers/${baseNameOf wallpaper}";
                  value.source = wallpaper;
                }) config.home.wallpapers
              );
            })
          ];
        }
      )
    ];
  };
}
