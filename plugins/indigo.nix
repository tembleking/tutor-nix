{
  tutor,
  buildPythonPackage,
  pythonOlder,
  fetchPypi,
  setuptools,
  tutor-mfe,
}:
buildPythonPackage rec {
  pname = "tutor_indigo";
  version = tutor.version;
  pyproject = true;

  disabled = pythonOlder "3.8";

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-W1EoCw6aX+pPcDW7ghu9FyeL7KU/3KJlLPCP9AxDCI8=";
  };

  nativeBuildInputs = [setuptools];

  propagatedBuildInputs = [
    tutor
    tutor-mfe
  ];

  doCheck = false;
  pythonImportsCheck = ["tutorindigo"];
}
