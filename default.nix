(import ./reflex-platform {}).project ({ pkgs, ... }: {
  
  withHoogle = false;
  packages = {
    project = ./.;
  };

  shells = {
    ghc   = ["project"];
    ghcjs = ["project"];
  };
})

