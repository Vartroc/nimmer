{ util, ... }:
{
vim = {
  theme = {
    enable = true;
    name = "catppuccin";
    style = "macchiato";
  };
  globals.mapleader = " ";
  
  keymaps = [
    (util.mkKeymap' "n" "<leader>tb" ":lua vim.lsp.buf.format()<CR>" "Format the current buffer/file")
  ];
};
}
