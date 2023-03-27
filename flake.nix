{
  description = "GPT Cli";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/master";
  };

  outputs = { self, nixpkgs }:
    let
      pkgs = nixpkgs.legacyPackages.x86_64-linux;
      python = pkgs.python3.withPackages (ps: with ps; [
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
    in {
      packages.x86_64-linux.hello = nixpkgs.legacyPackages.x86_64-linux.hello;
      packages.x86_64-linux.default = self.packages.x86_64-linux.hello;
      devShell.x86_64-linux = pkgs.mkShell {
        buildInputs = [
          python
        ];
      };
    };
}
