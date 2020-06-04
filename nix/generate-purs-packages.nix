{ pkgs ? import <nixpkgs> {} }:
let
  inputNames = (builtins.fromJSON (builtins.readFile ../psc-package.json)).depends;
  packagesJson = ../packages.json;
  psc-package-nix = pkgs.fetchFromGitHub {
    owner = "justinwoo";
    repo = "psc-package-nix";
    rev = "dcded6dc74c31208995cfb6666da026b1469b660";
    sha256 = "1zyn0d0373l2lprb1am3p1404yznlxrjcl4nwf23mlnyq3xqkzvq";
  };
  solvedSet = import "${psc-package-nix}/nix/solve-set.nix" { inherit pkgs packagesJson inputNames; };
  generatePursPackages = pkgs.writeShellScriptBin "generate-purs-packages" ''
    node ${psc-package-nix}/src/generate-purs-packages-nix.js ${solvedSet.pkgSpecsJSON}
  '';
in
pkgs.runCommand "generate-purs-packages" {
  src = generatePursPackages;
  buildInputs = [
    pkgs.makeWrapper
  ];
} ''
  mkdir -p $out/bin
  target=$out/bin/generate-purs-packages
  cp $src/bin/generate-purs-packages $target
  chmod +x $target
  wrapProgram $target --prefix PATH : ${pkgs.lib.makeBinPath [
  pkgs.nodejs
  pkgs.nix-prefetch-git
]}''
