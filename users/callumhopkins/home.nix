{ ... }:

{
  imports = [
    ./applications
    ./desktop
    ./utilities
  ];

  xdg = {
    enable = true;

    configFile."nixpkgs/config.nix".text = "{ allowUnfree = true; }";

    userDirs = {
      enable = true;

      desktop = "$HOME/Desktop";
      documents = "$HOME/Documents";
      download = "$HOME/Downloads";
      music = "$HOME/Music";
      pictures = "$HOME/Pictures";
      videos = "$HOME/Videos";
      projects = "$HOME/Projects";

      templates = null;
      publicShare = null;

      createDirectories = true;
      setSessionVariables = true;
    };

  };

  home = {
    username = "callumhopkins";
    homeDirectory = "/home/callumhopkins";

    avatar = ./assets/avatar.jpg;

    wallpapers = [
      ./assets/wallpapers/default.jpg
    ];

    stateVersion = "26.05";
  };
}
