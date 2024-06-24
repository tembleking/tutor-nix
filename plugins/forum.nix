{
  tutor,
  buildPythonPackage,
  pythonOlder,
  fetchPypi,
  setuptools,
}:
buildPythonPackage rec {
  pname = "tutor-forum";
  version = tutor.version;
  pyproject = true;

  disabled = pythonOlder "3.8";

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-xibK6N7vR43dc78zLAN7ezbcv0R0luPIq8LuHG04fIE=";
  };

  nativeBuildInputs = [setuptools];

  propagatedBuildInputs = [
    tutor
  ];

  doCheck = false;
  pythonImportsCheck = ["tutorforum"];
}
