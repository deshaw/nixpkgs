{ lib, buildPythonPackage, fetchFromGitHub, six }:

buildPythonPackage rec {
  pname = "gnlpy";
  version = "0.1.2";

  # PyPI doesn't have the source tarball.
  src = fetchFromGitHub {
    owner = "facebook";
    repo = pname;
    # Last release was a while back.
    rev = "43ffece44cd8264a489a24add5d9b395b65b8b59";
    sha256 = "0m90i634k6s9pcvlpc5xk2zq1sxx7bgq2q6vlxjbcg001s76wx1b";
  };
  propagatedBuildInputs = [ six ];

  meta = with lib; {
    description = "Generic NetLink in Python";
    homepage = "https://github.com/facebook/gnlpy";
    license = licenses.bsd3;
    maintainers = with maintainers; [ limeytexan ];
  };
}
