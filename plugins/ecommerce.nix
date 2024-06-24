{
  tutor,
  buildPythonPackage,
  pythonOlder,
  fetchPypi,
  setuptools,
  tutor-discovery,
  tutor-mfe,
}:
buildPythonPackage rec {
  pname = "tutor_ecommerce";
  version = tutor.version;
  pyproject = true;

  disabled = pythonOlder "3.8";

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-bt6o7hrCIMLLSueQGvt2mSq44NCgYyByElGvvW4wgVY=";
  };

  nativeBuildInputs = [setuptools];

  propagatedBuildInputs = [
    tutor
    tutor-discovery
    tutor-mfe
  ];

  doCheck = false;
  pythonImportsCheck = ["tutorecommerce"];
}
