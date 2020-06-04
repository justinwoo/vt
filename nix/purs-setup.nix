#!/usr/bin/env nix-shell
#!nix-shell ./purs-setup.nix --run exit
{ pkgs ? import <nixpkgs> {} }:
let
  packages-json = import ./packages-json.nix { inherit pkgs; };
  generate-purs-packages = import ./generate-purs-packages.nix { inherit pkgs; };
in
pkgs.mkShell {
  buildInputs = [
    generate-purs-packages
  ];
  shellHook = ''
    echo "Copying packages.json..."
    cp --no-preserve=mode ${packages-json} packages.json
    echo "Generating purs-packages.nix..."
    generate-purs-packages > purs-packages.nix
  '';
}
