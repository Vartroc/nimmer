{ util, ...}:{
vim = {
  mini = {
    comment.enable = true;
    pairs.enable = true;
    bracketed.enable = true;
    files = {
      enable = true;
      setupOpts = {
        mappings = {
          go_in = "s";
          go_in_plus = "S";
          go_out = "b";
          go_out_plus = "B";
        };
      };
    };
    notify.enable = true;
    animate.enable = true; 
  };
  keymaps = [
    (util.mkKeymap "n" "<leader>tn" ":lua MiniFiles.open()<CR>")
  ];
};
}

