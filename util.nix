{
  mkKeymap' = mode: key: action: desc: {
    inherit
      mode
      key
      action
      desc
      ;
  };
  mkKeymap = mode: key: action: {
    inherit
      mode
      key
      action
      ;
  };
}
