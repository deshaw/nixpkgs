{ lib, fetchPypi, buildPythonPackage, six, django }:

buildPythonPackage rec {
  pname = "kobo";
  version = "0.12.0";

  src = fetchPypi {
    inherit pname version;
    sha256 = "1cdgj266dgnvgzbpmdv5pn6h8qn99672gdd6k6ki32i7y6mkqssk";
  };

  propagatedBuildInputs = [ six ];

  checkInputs = [ django ];

  doCheck = false; # FIXME
  meta = with lib; {
    description = "A collection of python modules designed for RHEL";
    homepage = "https://github.com/release-engineering/kobo";
    license = lib.licenses.lgpl2;
    maintainers = [ maintainers.limeytexan ];
  };
}
