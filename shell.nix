{ pkgs ? import <nixpkgs> { }
, user ? "justin"
, dir ? "/home/${user}/Code/vt"
}:
let
  easy-ps = import ./nix/easy-ps.nix { inherit pkgs; };
  build-purs = import ./nix/build-purs.nix { inherit pkgs; };

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

  copy-purs-output = pkgs.writeShellScriptBin "copy-vt-purs-output" ''
    set -e
    nix-build nix/build-purs.nix -A vt-purs-output -o vt-purs-result
    rm -rf output
    mkdir output
    cp -R --no-preserve=mode vt-purs-result/* output
    rm vt-purs-result
  '';

  build-purs-script = pkgs.writeShellScriptBin "build-purs" ''
    purs compile ${toString build-purs.sourceGlobs} "src/**/*.purs"
  '';

  ld-library-path = pkgs.lib.makeLibraryPath [
    pkgs.zlib
    pkgs.sqlite.out
  ];

  library-path = pkgs.lib.makeLibraryPath [
    pkgs.sqlite
  ];

in
pkgs.mkShell {
  buildInputs = [
    easy-ps.purs-0_13_8
    easy-ps.psc-package
    install-systemd-unit
    copy-purs-output
    build-purs-script
    pkgs.sqlite
  ];

  shellHook = ''
    export PURS_IDE_SOURCES='${toString build-purs.unquotedSourceGlobs}'
    export LD_LIBRARY_PATH='${ld-library-path}'
    export LIBRARY_PATH='${library-path}'
  '';
}
