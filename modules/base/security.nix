{ lib, config, ... }:

{
  options.security.polkit.trustedPrograms = lib.mkOption {
    type = lib.types.listOf lib.types.pathInStore;
    default = [ ];
    description = ''
      Executable paths in the Nix store that may be run through pkexec without
      authentication by an active local session.
    '';
  };

  config.security = {
    sudo.enable = true;

    polkit = {
      enable = true;
      enablePkexecWrapper = true;

      extraConfig = lib.mkAfter ''
        polkit.addRule(function(action, subject) {
        	if (
        		(action.id === "org.freedesktop.login1.reboot" || 
        		 action.id === "org.freedesktop.login1.power-off" || 
        		 action.id === "org.freedesktop.login1.reboot-multiple-sessions" ||
        		 action.id === "org.freedesktop.login1.power-off-multiple-sessions")
        		&& subject.isInGroup("wheel")
        	) {
        		return polkit.Result.YES;
        	}
        });

        polkit.addRule(function(action, subject) {
          const trustedPrograms = ${builtins.toJSON config.security.polkit.trustedPrograms};

          if (
            action.id == "org.freedesktop.policykit.exec" &&
            subject.local &&
            subject.active &&
            trustedPrograms.indexOf(action.lookup("program")) >= 0
          ) {
            return polkit.Result.YES;
          }
        });
      '';
    };
  };
}
