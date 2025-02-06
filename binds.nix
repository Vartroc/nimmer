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
];
};
}
