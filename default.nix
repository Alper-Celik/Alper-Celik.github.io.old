{ stdenvNoCC
, imagemagick
, ruby
, bundler
, bundix
, bundlerEnv
, src ? ./.
}:
let

  ruby-env = bundlerEnv
    {
      name = "my-blog";
      gemdir = src;
      inherit ruby;
    };
in
stdenvNoCC.mkDerivation {
  name = "my-blog";
  inherit src;

  buildInputs = [ ruby-env bundix bundler ];

  buildPhase = ''
    mkdir $out
    jekyll build -d $out
  '';
}
