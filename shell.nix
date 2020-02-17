{ pkgs ? import <nixpkgs> {}
, user ? "justin"
, dir ? "/home/${user}/Code/vt"
}:


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

  install-purs-packages = pkgs.writeShellScriptBin "install-purs-packages" ''
    #!/usr/bin/env bash
    ${builtins.toString (builtins.map cpPackage (builtins.attrValues purs-packages))}
    echo done installing deps.
  '';

  build-purs = pkgs.writeShellScriptBin "build-purs" ''
    #!/usr/bin/env bash
    purs compile "src/**/*.purs" ".psc-package/*/*/*/src/**/*.purs"
  '';

  storePath = x: ''"${x.fetched.outPath}/src/**/*.purs"'';

  build-purs-from-store = pkgs.writeShellScriptBin "build-purs-from-store" ''
    #!/usr/bin/env bash
    purs compile "src/**/*.purs" \
      ${builtins.toString (builtins.map storePath (builtins.attrValues purs-packages))}
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
    easy-ps.purs
    soba
    install-purs-packages
    build-purs
    build-purs-from-store
    install-systemd-unit
  ];
}
