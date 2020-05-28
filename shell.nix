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

  soba = import (
    pkgs.fetchFromGitHub {
      owner = "justinwoo";
      repo = "soba";
      rev = "d23c4d54cc9ec60e98cba494c530f246acaa1b61";
      sha256 = "0azg091i38lq77iplxlp5z568s32qvy08gnhybf4rgqjgip2zpzs";
    }
  ) {
    inherit pkgs;
  };

  purs-packages = import ./purs-packages.nix { inherit pkgs; };

  purs-package-path = pp: ".psc-package/local/${pp.name}/${pp.version}";

  cpPackage = pp:
    let
      target = purs-package-path pp;
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

  purs-package-glob-quoted = pp: ''"${purs-package-path pp}/src/**/*.purs"'';

  purs-packages-globs = builtins.map purs-package-glob-quoted (builtins.attrValues purs-packages);

  build-purs = pkgs.writeShellScriptBin "build-purs" ''
    #!/usr/bin/env bash
    purs compile "src/**/*.purs" ${toString (purs-packages-globs)}
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
