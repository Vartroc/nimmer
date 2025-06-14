{
  config,
  pkgs,
  lib,
  ...
}:
let
  inherit (builtins) attrNames;
  inherit (lib) mkEnableOption mkOption;
  inherit (lib.modules) mkIf mkMerge;
  inherit (lib.types)
    either
    listOf
    package
    str
    ;

  cfg = config.vim.languages.openscad;
  packageToCmd =
    package: defaultCmd:
    if builtins.isList package then
      lib.nvim.lua.expToLua package
    else
      lib.nvim.lua.expToLua [ "${package}/bin/${defaultCmd}" ];

  servers = {
    openscad-lsp = {
      package = pkgs.openscad-lsp;
      lspConfig = ''
        lspconfig.openscad_lsp.setup{
          capabilities = capabilities,
          on_attach = default_on_attach,
          cmd = ${lib.nvim.lua.expToLua (packageToCmd cfg.lsp.package "openscad-lsp")},
          root_dir = lspconfig.util.find_git_ancestor(vim.fn.getcwd()) or vim.fn.getcwd(),
        }
      '';

    };
  };

  defaultServer = "openscad-lsp";
in
{
  options.vim.languages.openscad = {
    enable = mkEnableOption "OpenSCAD language support";

    lsp = {
      enable = mkEnableOption "OpenSCAD LSP support" // {
        default = config.vim.languages.enableLSP;
      };
      server = mkOption {
        description = "OpenSCAD LSP server to use";
        type = lib.types.enum (attrNames servers);
        default = defaultServer;
      };

      package = mkOption {
        description = "OpenSCAD LSP server package, or the command to run as a list of strings";
        example = ''[lib.getExe pkgs.openscad-lsp] '';
        type = either package (listOf str);
        default = servers.${cfg.lsp.server}.package;
      };
    };
  };

  config = mkIf cfg.enable (mkMerge [
    (mkIf cfg.lsp.enable {
      vim.lsp.lspconfig.enable = true;
      vim.lsp.lspconfig.sources.openscad-lsp = servers.${cfg.lsp.server}.lspConfig;
    })
  ]);
}
