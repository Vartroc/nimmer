{ pkgs, ... }:
{
vim.languages.nix = {
  enable = true;
  format = {
    enable = true;
    package = pkgs.nixfmt-rfc-style;
    type = "nixfmt";
  };
  lsp = { 
    enable = true;
    # package = pkgs.nixd;
    # server = "nixd";
  };
  treesitter.enable = true;
  };
}
