{ pkgs, ... }:

{
  programs.zsh = {
    enable = true;

    enableCompletion = true;
    syntaxHighlighting.enable = true;
    autosuggestion.enable = true;

    history = {
      size = 10000;
      ignoreAllDups = true;
      share = true;
    };

    shellAliases = {
      ll = "ls -la";
      gs = "git status";
      cat = "bat -pP";
    };

    initContent = ''
      typeset -a _completion_colors
      _completion_colors=("''${(@s.:.)LS_COLORS}")
      _completion_colors=("''${(@)_completion_colors:#ow=*}")
      _completion_colors=("''${(@)_completion_colors:#tw=*}")
      _completion_colors+=(
        'ow=01;34'
        'tw=01;34'
      )
      zstyle ':completion:*' list-colors "''${_completion_colors[@]}"
      unset _completion_colors
    '';

    oh-my-zsh = {
      enable = true;

      theme = "robbyrussell";

      plugins = [
        "git"
        "sudo"
        "eza"
      ];
    };
  };
}
