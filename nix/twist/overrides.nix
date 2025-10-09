# Copyright (C) 2022-2024 Akira Komamura
# SPDX-License-Identifier: MIT

{
  pkgs,
}:
_eself: esuper:
builtins.intersectAttrs esuper {
  kl = esuper.kl.overrideAttrs (old: {
    # The libraries are improperly packaged, so disable byte-compilation for now.
    dontByteCompile = true;
  });
   devdocs = esuper.devdocs.overrideAttrs (_: {
    preBuild = ''
      substituteInPlace devdocs.el --replace-fail "(require 'mathjax)" "(require 'mathjax nil t)"
    '';
  });
  emacsql-sqlite = esuper.emacsql-sqlite.overrideAttrs (old: {
    buildInputs = old.buildInputs ++ [ pkgs.sqlite ];

    postBuild = ''
      cd sqlite
      make
      cd ..
    '';
  });
}
