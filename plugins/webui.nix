{
  tutor,
  buildPythonPackage,
  pythonOlder,
  fetchPypi,
  setuptools,
  click-repl,
}:
buildPythonPackage rec {
  pname = "tutor-webui";
  version = tutor.version;
  pyproject = true;

  disabled = pythonOlder "3.8";

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-Ye/vf8dN/YCAozEBUXArRDVB/qHx0eRGQ46GomSLy9w=";
  };

  nativeBuildInputs = [setuptools];

  propagatedBuildInputs = [
    tutor
    click-repl
  ];

  doCheck = false;
  pythonImportsCheck = ["tutorwebui"];
}
