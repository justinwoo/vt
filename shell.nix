{ pkgs ? import <nixpkgs> {} }:

let
  easy-ps = import (
    pkgs.fetchFromGitHub {
      owner = "justinwoo";
      repo = "easy-purescript-nix";
      rev = "14e7d85431e9f9838d7107d18cb79c7fa534f54e";
      sha256 = "0lmkppidmhnayv0919990ifdd61f9d23dzjzr8amz7hjgc74yxs0";
    }
  ) {
    inherit pkgs;
  };

  soba = import (
    pkgs.fetchFromGitHub {
      owner = "justinwoo";
      repo = "soba";
      rev = "2add8804bce7e7c1ab5eb1c3d8f6783e938a04d3";
      sha256 = "1qagyklcllr2sxdb315prw33af6g37762zgk2ahh3ifxpns6ifxx";
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
    soba
    install-purs-packages
    build-purs
    build-purs-from-store
  ];
}
