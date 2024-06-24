{
  tutor,
  buildPythonPackage,
  pythonOlder,
  fetchPypi,
  setuptools,
}:
buildPythonPackage rec {
  pname = "tutor-minio";
  version = tutor.version;
  pyproject = true;

  disabled = pythonOlder "3.8";

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-iVrVbumGhbirCvuqSQJjEtUnV+ikIzVd6jNnf9X6m4g=";
  };

  nativeBuildInputs = [setuptools];

  propagatedBuildInputs = [
    tutor
  ];

  doCheck = false;
  pythonImportsCheck = ["tutorminio"];
}
