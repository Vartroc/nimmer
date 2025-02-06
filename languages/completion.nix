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
              "<C-j>" = fallback "select_next";
              "<C-k>" = fallback "select_prev";
              "<CS-j>" = fallback "scroll_documentation_down";
              "<CS-k>" = fallback "scroll_documentation_up";
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
/*            cmdline = [ ];
              spell = {
                name = "Spell";
                module = "blink-cmp-spell";
              };
            };*/
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
