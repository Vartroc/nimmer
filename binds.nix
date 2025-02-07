{ util, ... }:
{
  vim = {
    keymaps = [
      (util.mkKeymap "" "b" "h")
      (util.mkKeymap "" "n" "j")
      (util.mkKeymap "" "r" "k")
      (util.mkKeymap "" "s" "l")

      (util.mkKeymap "n" "ä" "b")
      (util.mkKeymap "n" "ö" "n")
      (util.mkKeymap "n" "ü" "r")
      (util.mkKeymap "n" "ß" "s")

      (util.mkKeymap' "n" "<leader>tb" ":lua vim.lsp.buf.format()<CR>" "Format the current buffer/file")
    ];
    binds.whichKey = {
      enable = true;
      register = {
        "<leader>f" = " Picker";
        "<leader>l" = " LSP";
        "<leader>t" = "⨁ Misc";
      };
      setupOpts = {
        preset = "classic";
        delay = 0;
        icons = {
          mappings = false;
          separator = "➜";
          group = "";
        };
        triggers = [
          {
            "@" = "<leader>";
            mode = "n";
          }
        ];
      };
    };
  };
}
