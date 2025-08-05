{ pkgs, ... }:
{
  imports = [
    ./completion.nix

    ./markdown.nix
    ./python.nix
    ./rust.nix
    ./nix.nix
    # ./openscad.nix
    # ./openscad-enable.nix
  ];

  vim = {
    languages = {
      enableFormat = true;
      enableTreesitter = true;
      # enableExtraDiagnostics = true;
      # enableDAP = true;
    };
    lsp = {
      enable = true;
      formatOnSave = true;
      # trouble.enable = true;
      # lspSignature.enable = true;
      # otter-nvim.enable = true;
    };
    treesitter = {
      enable = true;
      addDefaultGrammars = true;
      grammars = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
        yaml
        latex
      ];
    };
  };
}
