{ lib, python3Packages, dependencies }:
buildPythonApplication {
  pname = "gpt-cli";
  version = "1.0";

  propagatedBuildInputs = dependencies python3Packages;

  src = ./.;
}
