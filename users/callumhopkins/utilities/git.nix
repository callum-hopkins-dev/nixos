{ ... }:

{
  programs.git = {
    enable = true;

    lfs.enable = true;

    settings = {
      user = {
        name = "Callum Hopkins";
        email = "callum@hopkins.family";
      };

      init.defaultBranch = "main";
      pull.rebase = true;
      core.editor = "hx";
      push.autoSetupRemote = true;
    };
  };

  programs.gh.enable = true;
}
