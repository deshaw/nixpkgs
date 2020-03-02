{ buildPythonPackage, lib, isPy3k, django, docutils, fetchPypi, nose, python, six
, sqlalchemy, sqlobject }:

buildPythonPackage rec {
  pname = "fixture";
  version = "1.5.11";

  disabled = !isPy3k;

  src = fetchPypi {
    inherit pname version;
    sha256 = "04j6wr4zf0v3wamd338gs78xmjxg7cpyzvrdn6h3za5ipmpqkwya";
  };

  nativeBuildInputs = [ docutils ];

  propagatedBuildInputs = [ django six sqlalchemy sqlobject ];

  checkInputs = [ nose ];

  checkPhase = ''
    ${python.interpreter} setup.py nosetests
  '';

  doCheck = false; # XXX Fix this - had problems with django_example?!?

  meta = with lib; {
    description = "Python module for loading and referencing test data";
    homepage = "http://farmdev.com/projects/fixture/";
    license = licenses.lgpl3;
    maintainers = [ maintainers.limeytexan ];
  };
}
