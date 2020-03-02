{ lib, buildPythonPackage, fetchPypi, setuptools, dateutil, cron}:

buildPythonPackage rec {
  pname = "python-crontab";
  version = "2.4.0";

  src = fetchPypi {
    inherit pname version;
    sha256 = "1rksppkp25api2gqxxvb0q77wmai7gwgpd8ndvyfcck0yy7n1h9s";
  };

  buildInputs = [ dateutil ];

  doCheck = false; # Tests try to create user crons

  meta = with lib; {
    description = "Crontab module for reading and writing crontab files and accessing the system cron automatically and simply using a direct API.";
    homepage = "https://pypi.org/project/python-crontab/";
    license = licenses.lgpl3;
    maintainers = [ maintainers.limeytexan ];
  };
}
