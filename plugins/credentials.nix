{
  tutor,
  buildPythonPackage,
  pythonOlder,
  fetchPypi,
  setuptools,
  tutor-mfe,
  tutor-discovery,
}:
buildPythonPackage rec {
  pname = "tutor-credentials";
  version = tutor.version;
  pyproject = true;

  disabled = pythonOlder "3.8";

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-P1koB7fi3yT23sftoNRvWItl5W/w9QOULISmIlrqD9M=";
  };

  nativeBuildInputs = [setuptools];

  propagatedBuildInputs = [
    tutor
    tutor-mfe
    tutor-discovery
  ];

  doCheck = false;
  pythonImportsCheck = ["tutorcredentials"];
}
