{
imports = [
  ./plugins/default.nix
  ./languages/default.nix
  ./binds.nix
  ./misc.nix
  ./options.nix

];
_module.args.util = import ./util.nix;
}
