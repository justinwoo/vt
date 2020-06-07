{ pkgs ? import <nixpkgs> {} }:
let
  easy-ps = import ./easy-ps.nix { inherit pkgs; };

  package-set-archive = import ./package-set-archive.nix { inherit pkgs; };
  inputNames = (builtins.fromJSON (builtins.readFile ../psc-package.json)).depends;
  packagesJson = ../packages.json;
  psc-package-nix = pkgs.fetchFromGitHub {
    owner = "justinwoo";
    repo = "psc-package-nix";
    rev = "dcded6dc74c31208995cfb6666da026b1469b660";
    sha256 = "1zyn0d0373l2lprb1am3p1404yznlxrjcl4nwf23mlnyq3xqkzvq";
  };
  solved = import "${psc-package-nix}/nix/solve-set.nix" { inherit pkgs packagesJson inputNames; };

  getUnquotedSourceGlob = key:
    let
      x = builtins.getAttr key solved.pkgSpecs;
    in ''${package-set-archive}/pkgs/${key}/${x.version}/src/**/*.purs'';
  unquotedSourceGlobs = map getUnquotedSourceGlob solved.pkgNames;
  quote = x: ''"${x}"'';
  sourceGlobs = map quote unquotedSourceGlobs;

  vt-purs-output = pkgs.runCommand "vt-purs-output" {
    buildInputs = [ easy-ps.purs-0_13_8 ];
  } ''
    mkdir $out
    cd $out
    purs compile ${toString sourceGlobs} "${../src}/**/*.purs"
  '';
in
{ inherit solved sourceGlobs unquotedSourceGlobs vt-purs-output; }
