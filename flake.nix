{
  description = "GPT Cli";

  inputs = {
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
        dependencies = (ps: with ps; [
          aiohttp
          aiosignal
          async-timeout
          attrs
          black
          blessings
          certifi
          charset-normalizer
          click
          colorama
          frozenlist
          idna
          markdown-it-py
          mdurl
          multidict
          mypy-extensions
          openai
          packaging
          pathspec
          platformdirs
          prompt-toolkit
          pygments
          pyyaml
          requests
          rich
          six
          tomli
          tqdm
          typing-extensions
          urllib3
          wcwidth
          yarl
        ]);
        python = pkgs.python3.withPackages dependencies;
      in {
        packages = {
          default = pkgs.python3Packages.buildPythonApplication {
            pname = "gpt";
            version = "1.0";
            propagatedBuildInputs = dependencies pkgs.python3Packages;
            src = ./.;
            postInstall = "mv $out/bin/gpt.py $out/bin/gpt";
          };
        };

        devShell = pkgs.mkShell {
          buildInputs = [
            python
          ];
        };
      }
  );
}
