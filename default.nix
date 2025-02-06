{
imports = [
  ./plugins/default.nix
  ./binds.nix
  ./misc.nix

];
_module.args.util = import ./util.nix;
}
