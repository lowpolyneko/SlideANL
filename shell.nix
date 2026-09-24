let
  pkgs = import <nixpkgs> { };

  # TeX Live 2025's latexminted 0.6.0 crashes on Python 3.14 (nixpkgs#542483),
  # so build texlive against Python 3.11.
  texlive = pkgs.lib.fix (self: pkgs.texlive.override {
    python3 = pkgs.python311;
    texlive = self;
  });
in
pkgs.mkShell {
  packages = [ texlive.schemes.texliveFull ];
}
