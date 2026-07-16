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

          formatter = {
            command = "prettierd";
            args = [ ".html" ];
          };

          auto-format = true;

          language-servers = [
            "vscode-html-language-server"
            "tailwindcss-ls"
          ];
        }

        {
          name = "css";

          formatter = {
            command = "prettierd";
            args = [ ".css" ];
          };

          auto-format = true;

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

      language-server = {
        vscode-css-language-server.config.css.validate = false;

        tailwindcss-ls.config.tailwindCSS = {
          includeLanguages = {
            rust = "html";
            "*.rs" = "html";
          };

          experimental.classRegex = [ ''class=\"([^\"]*)\"'' ];
        };
      };
    };

    defaultEditor = true;
  };

  home.packages = [
    pkgs.nixfmt
    pkgs.taplo
    pkgs.nixd
    pkgs.prettierd
    pkgs.typescript-language-server
    pkgs.vscode-langservers-extracted
  ];

  stylix.targets.helix.enable = false;
}
