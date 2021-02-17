{ pkgs ? import <nixpkgs> {} }:

import (
  pkgs.fetchFromGitHub {
    owner = "justinwoo";
    repo = "esbuild-drv";
    rev = "d8a8c7d3eeeade734d71f8c5ba82f36471b4d3ad";
    sha256 = "1922iqgzl4addl2kljvnp7cgjwp42s3phmqjxz5y6cajw77sn6x5";
  }
) {
  inherit pkgs;
}
