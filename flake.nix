{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nvf.url = "github:notashelf/nvf";
  };

  outputs = {
    self,
    nixpkgs,
    ...
  } @ inputs: {
    packages."x86_64-linux" = let
        neovimConfigured = (inputs.nvf.lib.neovimConfiguration {
          inherit (nixpkgs.legacyPackages."x86_64-linux") pkgs;
          modules = [
	    ./default.nix   
	  ];
	  extraSpecialArgs = {
	    # Inputs is seemingly reserved, though the docs don't show it - LilleAila nvf-config
	    inputs' = inputs;
	  };
        });
    in {
      # Set the default package to the wrapped instance of Neovim.
      # This will allow running your Neovim configuration with
      # `nix run` and in addition, sharing your configuration with
      # other users in case your repository is public.
      default = neovimConfigured.neovim;
    };
  };
}
