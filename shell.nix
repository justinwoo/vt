{ pkgs ? import <nixpkgs> {}
, user ? "justin"
, dir ? "/home/${user}/Code/vt"
}:
let
  easy-ps = import (
    pkgs.fetchFromGitHub {
      owner = "justinwoo";
      repo = "easy-purescript-nix";
      rev = "0ba91d9aa9f7421f6bfe4895677159a8a999bf20";
      sha256 = "1baq7mmd3vjas87f0gzlq83n2l1h3dlqajjqr7fgaazpa9xgzs7q";
    }
  ) {
    inherit pkgs;
  };

  purs-packages = import ./purs-packages.nix { inherit pkgs; };
  getQuotedSourceGlob = x: ''"${x.src}/src/**/*.purs"'';
  sourceGlobs = map getQuotedSourceGlob (builtins.attrValues purs-packages);
  vt-purs-output = pkgs.runCommand "vt-purs-output" {
    buildInputs = [ easy-ps.purs-0_13_8 ];
  } ''
    mkdir $out
    cd $out
    purs compile ${toString sourceGlobs} "${./src}/**/*.purs"
  '';

  home = "/home/${user}";
  nix-init = ''. ${home}/.bashrc'';
  cmd = ''cd ${dir} && target/debug/backend'';

  sdunit = pkgs.writeTextFile {
    name = "vt";
    destination = "/vt.service";
    text = ''
      [Unit]
      Description=vt - vid tracker

      [Service]
      Type=simple
      ExecStart=/bin/bash -c "${nix-init} && ${cmd}"

      [Install]
      WantedBy=default.target
    '';
  };

  install-systemd-unit = pkgs.writeShellScriptBin "install-systemd-unit" ''
    #!/usr/bin/env nix-shell
    #!nix-shell -i bash

    service="vt.service"
    systemctl --user disable --now $service | echo "$service is already disabled"
    systemctl --user enable --now "${sdunit}/$service"
    systemctl --user daemon-reload
    systemctl --user reset-failed
  '';
in
pkgs.mkShell {
  buildInputs = [
    easy-ps.purs-0_13_8
    easy-ps.psc-package
    install-systemd-unit
  ];

  shellHook = ''
    alias copy-purs-output="rm -rf output; cp -R --no-preserve=mode ${vt-purs-output}/output output"
  '';
}
