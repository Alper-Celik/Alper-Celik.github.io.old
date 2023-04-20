{ stdenvNoCC
, src
}:
stdenvNoCC.mkDerivation {
  name = "my-blog";
  inherit src;

  buildPhase = ''
    mkdir $out
    echo "test" > $out/index.html
  '';
}
