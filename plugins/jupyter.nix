{
  tutor,
  buildPythonPackage,
  pythonOlder,
  fetchPypi,
  setuptools,
  tutor-mfe,
}:
buildPythonPackage rec {
  pname = "tutor-jupyter";
  version = tutor.version;
  pyproject = true;

  disabled = pythonOlder "3.8";

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-FOjkp+HPuApbMtkjL/BaxKCfQKILhhaTF/7HGTgGTLs=";
  };

  nativeBuildInputs = [setuptools];

  propagatedBuildInputs = [
    tutor
    tutor-mfe
  ];

  doCheck = false;
  pythonImportsCheck = ["tutorjupyter"];
}
