{ pkgs ? import <nixpkgs> {}
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
in
pkgs.mkShell {
  buildInputs = [
    easy-ps.purs-0_13_8
    easy-ps.psc-package
    install-systemd-unit
  ];

  shellHook = ''
    export PURS_IDE_SOURCES='${toString build-purs.sourceGlobs}'
    alias copy-purs-output="rm -rf output; cp -R --no-preserve=mode ${build-purs.vt-purs-output}/output output"
  '';
}
