{
  tutor,
  buildPythonPackage,
  pythonOlder,
  fetchPypi,
  setuptools,
}:
buildPythonPackage rec {
  pname = "tutor-discovery";
  version = tutor.version;
  pyproject = true;

  disabled = pythonOlder "3.8";

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-yL1b/p7rjEdH85NyhYV5goAr/uR6N1o+hF01bPWzb7g=";
  };

  nativeBuildInputs = [setuptools];

  propagatedBuildInputs = [
    tutor
  ];

  doCheck = false;
  pythonImportsCheck = ["tutordiscovery"];
}
