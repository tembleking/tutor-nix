{
  buildPythonPackage,
  pythonOlder,
  fetchPypi,
  setuptools,
  lib,
  appdirs,
  click,
  jinja2,
  kubernetes,
  mypy,
  pycryptodome,
  pyyaml,
  typing-extensions,
  importlib-metadata,
  importlib-resources,
}: let
  tutor = buildPythonPackage rec {
    pname = "tutor";
    version = "18.0.0";
    pyproject = true;

    disabled = pythonOlder "3.8";

    src = fetchPypi {
      inherit pname version;
      hash = "sha256-CUnV/tVwJt184TUnwgF+to2xNECKi9dsgCP5vuosjP8=";
    };

    nativeBuildInputs = [setuptools];

    propagatedBuildInputs = [
      appdirs
      click
      jinja2
      kubernetes
      mypy
      pycryptodome
      pyyaml
      typing-extensions
      importlib-metadata
      importlib-resources
    ];

    doCheck = false;

    pythonImportsCheck = ["tutor"];

    meta = with lib; {
      description = "Tutor is the official Docker-based Open edX distribution, both for production and local development. The goal of Tutor is to make it easy to deploy, customise, upgrade and scale Open edX. Tutor is reliable, fast, extensible, and it is already used to deploy hundreds of Open edX platforms around the world.";
      homepage = "https://pypi.org/project/tutor/";
      license = licenses.agpl3Only;
    };
  };
in
  tutor
