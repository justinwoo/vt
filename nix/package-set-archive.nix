{ pkgs ? import <nixpkgs> {} }:

pkgs.fetchzip {
  url = "https://github.com/justinwoo/package-set-archive/archive/849c296b5a682c17977ca1e6165c7dd17af82979.zip";
  sha256 = "08mrycpq75lg5nvvkgz0yj2ll8rbgdk63afmpxg04gma7wqqklzz";
}
