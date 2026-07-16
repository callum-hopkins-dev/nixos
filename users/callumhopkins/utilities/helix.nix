{ pkgs, ... }:

{
  programs.helix = {
    enable = true;

    settings = {
      theme = "dark_plus_transparent";

      editor.true-color = true;
    };

    themes = {
      dark_plus_transparent = {
        inherits = "dark_plus";

        "ui.background" = { };
        "ui.window" = { };
        "ui.gutter" = { };
        "ui.popup" = { };
        "ui.popup.info" = { };
        "ui.menu" = { };
        "ui.menu.info" = { };
        "ui.help" = { };
        "ui.linenr.selected".bg = { };
      };
    };

    languages = {
      language = [
        {
          name = "nix";
          auto-format = true;
        }

        {
          name = "toml";
          auto-format = true;
        }

        {
          name = "html";

          language-servers = [
            "vscode-html-language-server"
            "tailwindcss-ls"
          ];
        }

        {
          name = "css";

          language-servers = [
            "vscode-css-language-server"
            "tailwindcss-ls"
          ];
        }

        {
          name = "rust";

          language-servers = [
            "rust-analyzer"
            "tailwindcss-ls"
          ];
        }
      ];

      language-server.tailwindcss-ls.config.tailwindCSS.includeLanguages = {
        rust = "html";
        "*.rs" = "html";
      };
    };

    defaultEditor = true;
  };

  home.packages = [
    pkgs.nixfmt
    pkgs.taplo
    pkgs.nixd
    pkgs.typescript-language-server
    pkgs.vscode-langservers-extracted
  ];

  stylix.targets.helix.enable = false;
}
