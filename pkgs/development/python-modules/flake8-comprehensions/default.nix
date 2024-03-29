{ lib
, buildPythonPackage
, fetchFromGitHub
, flake8
, hatchling
, pythonOlder
, setuptools
}:

buildPythonPackage rec {
  pname = "flake8-comprehensions";
  version = "3.14.0";
  pyproject = true;

  disabled = pythonOlder "3.7";

  src = fetchFromGitHub {
    owner = "adamchainz";
    repo = pname;
    rev = "refs/tags/${version}";
    hash = "sha256-qu3hzERiIAO3NoYwGpbABgu7D3syByN0B66uejK0jtM=";
  };

  nativeBuildInputs = [
    hatchling
    setuptools
  ];

  propagatedBuildInputs = [
    flake8
  ];
  
  # while flake8-comprehensions has test suite, it requires dependency
  # that's not really popular pytest-flake8-path
  pythonImportsCheck = "flake8_comprehensions";
  
  meta = with lib; {
    description = "A flake8 plugin to help you write better list/set/dict comprehensions";
    homepage = "https://github.com/adamchainz/flake8-comprehensions";
    changelog = "https://github.com/adamchainz/flake8-comprehensions/blob/${version}/HISTORY.rst";
    license = licenses.mit;
    maintainers = with maintainers; [ dyniec ];
  };
}


