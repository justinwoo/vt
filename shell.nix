{ pkgs ? import <nixpkgs> {} }:

let
  easy-ps = import (
    pkgs.fetchFromGitHub {
      owner = "justinwoo";
      repo = "easy-purescript-nix";
      rev = "485471b86f764b9dd34e77ae767a629290f7f295";
      sha256 = "0fh7sxpnp8krs091imksrs6w3vw31sq9kpz26mdw1kbpa8f0sgby";
    }
  ) {
    inherit pkgs;
  };

  soba = import (
    pkgs.fetchFromGitHub {
      owner = "justinwoo";
      repo = "soba";
      rev = "e81a2a768bb22f6e7678f7296f96cbf1b45276ae";
      sha256 = "1xd80sm10d9k7v3807pz8kh1b09ahjmdxlgiiyrplnm08kjrphb6";
    }
  ) {
    inherit pkgs;
  };

  purs-packages = import ./purs-packages.nix { inherit pkgs; };

  cpPackage = pp:
    let
      target = ".psc-package/local/${pp.name}/${pp.version}";
    in
      ''
        mkdir -p ${target}
        cp --no-preserve=mode,ownership,timestamp -r ${pp.fetched.outPath}/* ${target}
      '';

  install-purs-packages = pkgs.runCommand "install-purs-packages" {} ''
    mkdir -p $out/bin
    target=$out/bin/install-purs-packages
    touch $target
    chmod +x $target
    >>$target echo '#!/usr/bin/env bash'
    >>$target echo '${builtins.toString (builtins.map cpPackage (builtins.attrValues purs-packages))}'
    >>$target echo 'echo done installing deps.'
  '';

  build-purs = pkgs.runCommand "build-purs" {} ''
    mkdir -p $out/bin
    target=$out/bin/build-purs
    touch $target
    chmod +x $target
    >>$target echo '#!/usr/bin/env bash'
    >>$target echo 'purs compile ".psc-package/*/*/*/src/**/*.purs" "src/**/*.purs"'
  '';

  storePath = x: ''"${x.fetched.outPath}/src/**/*.purs"'';

  build-purs-from-store = pkgs.runCommand "build-purs-from-store" {} ''
    mkdir -p $out/bin
    target=$out/bin/build-purs-from-store
    touch $target
    chmod +x $target
    >>$target echo '#!/usr/bin/env bash'
    >>$target echo 'purs compile ${builtins.toString (builtins.map storePath (builtins.attrValues purs-packages))} "src/**/*.purs"'
  '';

in
pkgs.mkShell {
  buildInputs = [
    easy-ps.purs
    easy-ps.spago
    easy-ps.spago2nix
    soba
    install-purs-packages
    build-purs
    build-purs-from-store
  ];
}
