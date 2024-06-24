{
  tutor,
  buildPythonPackage,
  pythonOlder,
  fetchPypi,
  setuptools,
}:
buildPythonPackage rec {
  pname = "tutor-android";
  version = tutor.version;
  pyproject = true;

  disabled = pythonOlder "3.8";

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-Eg4KADXU/iEeOntAmDSp48tpxLJv0Cwd01n5FwOJJFA=";
  };

  nativeBuildInputs = [setuptools];

  propagatedBuildInputs = [
    tutor
  ];

  doCheck = false;
  pythonImportsCheck = ["tutorandroid"];
}
