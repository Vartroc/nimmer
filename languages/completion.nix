{ pkgs, ... }:
{
  vim = {
    lazy.plugins = {
      "blink.cmp" = {
        package = pkgs.vimPlugins.blink-cmp;
        # event = [ "LspAttach" ];
        # ft = [ "markdown" ];
        event = [ "BufEnter" ];
        setupModule = "blink.cmp";

        setupOpts = {
          keymap =
            let
              fallback = a: [
                a
                "fallback"
              ];
            in
            {
              preset = "none";
              "<C-n>" = fallback "select_next";
              "<C-r>" = fallback "select_prev";
              "<CS-n>" = fallback "scroll_documentation_down";
              "<CS-r>" = fallback "scroll_documentation_up";
              "<C-space>" = [
                "show"
                "show_documentation"
                "hide_documentation"
              ];
              "<C-e>" = [ "hide" ];
              "<C-y>" = [ "select_and_accept" ];
            };

          #snippets.preset = "luasnip";

          sources = {
            default = [
              "lsp"
              "path"
              #    "snippets"
              "buffer"
            ];
          };

          completion = {
            menu = {
              auto_show = true;
            };

            documentation = {
              auto_show = true;
              auto_show_delay_ms = 500;
            };

            ghost_text.enabled = false;
          };
        };
      };
    };
  };
}
