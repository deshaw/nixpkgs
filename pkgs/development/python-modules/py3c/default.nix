{ lib, buildPythonPackage, fetchPypi, pytest }:

buildPythonPackage rec {
  pname = "py3c";
  version = "1.0";

  src = fetchPypi {
    inherit pname version;
    sha256 = "1h80jqi6r64kppxb4kshsiadrgc5hwk5arp3zcki01jf4ahknjz9";
  };

  meta = with lib; {
    homepage = http://py3c.readthedocs.io/;
    description = "py3c helps you port C extensions to Python 3";
    license = licenses.mit;
    maintainers = with maintainers; [ limeytexan ];
  };
}
