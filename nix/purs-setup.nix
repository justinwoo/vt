#!/usr/bin/env nix-shell
#!nix-shell ./purs-setup.nix --run exit
{ pkgs ? import <nixpkgs> {} }:
let
  package-set-archive = import ./package-set-archive.nix { inherit pkgs; };
in
pkgs.mkShell {
  shellHook = ''
    echo "Copying packages.json..."
    cp --no-preserve=mode ${package-set-archive}/packages.json packages.json
    echo "Setting up psc-package dependencies..."
    mkdir -p .psc-package/local
    cp --no-preserve=mode -R ${package-set-archive}/pkgs/* .psc-package/local
  '';
}
