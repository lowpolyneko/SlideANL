with import <nixpkgs> { };

mkShell {
  packages = [
    texlive.combined.scheme-full
  ];
}
