{ pkgs ? import <nixpkgs> {} }:

let
  easy-ps = import (
    pkgs.fetchFromGitHub {
      owner = "justinwoo";
      repo = "easy-purescript-nix";
      rev = "d5f44b9389b290874cc3e479741b746067f19a78";
      sha256 = "0vswaasg2ik7csi40a0ihpxxzp4c803z7mjd096f3lmjrbw4j4av";
    }
  ) {
    inherit pkgs;
  };

  soba = import (
    pkgs.fetchFromGitHub {
      owner = "justinwoo";
      repo = "soba";
      rev = "0f4f5162be2274cb9b1bfdc12f724aea84736ff3";
      sha256 = "1wyl9d6c8igxfm33kfg6b12yifgl0pac91xymnldzh1sj2l46khm";
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
