{
  tutor,
  buildPythonPackage,
  pythonOlder,
  fetchPypi,
  setuptools,
}:
buildPythonPackage rec {
  pname = "tutor-cairn";
  version = tutor.version;
  pyproject = true;

  disabled = pythonOlder "3.8";

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-fz0+5Ibn0dwyc4bSDliba3b2ElZe879ynrMR+v7Ny0s=";
  };

  nativeBuildInputs = [setuptools];

  propagatedBuildInputs = [
    tutor
  ];

  doCheck = false;
  pythonImportsCheck = ["tutorcairn"];
}
