{ lib, buildPythonPackage, fetchFromGitHub, gssapi, requests, mock }:

buildPythonPackage rec {
  pname = "requests-gssapi";
  version = "1.2.0";

  # Fetching from GitHub, since tests are not there in the sdist.
  src = fetchFromGitHub {
    owner = "pythongssapi";
    repo = pname;
    rev = "v${version}";
    sha256 = "150k90nd3bh3kzc03br5045vhfhi2g2s6lrqsfksa17kmj83bwi6";
  };

  checkInputs = [ mock ];
  propagatedBuildInputs = [ requests gssapi ];

  meta = with lib; {
    description =
      "Adds optional GSSAPI authentication support and supports mutual authentication";
    homepage = "https://github.com/pythongssapi/requests-gssapi";
    license = licenses.isc;
    maintainers = with maintainers; [ limeytexan ];
  };
}
