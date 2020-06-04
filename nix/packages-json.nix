{ pkgs ? import <nixpkgs> {} }:

pkgs.runCommand "jsonnet-packages-consumer" {
  src = pkgs.fetchFromGitHub {
    owner = "justinwoo";
    repo = "package-sets-jsonnet";
    rev = "07a1109d977b173fdf3764cbd274c57be5b562da";
    sha256 = "0rynm6nivhdfwrg0z2iqx3lz9fpwxfjpkaw5va2c8qiya9rb6pfx";
  };

  buildInputs = [
    pkgs.jsonnet
  ];
} ''
  jsonnet -J $src/src ${../packages.jsonnet} -o $out
''
