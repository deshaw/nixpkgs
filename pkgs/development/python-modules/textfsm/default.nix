{ lib, buildPythonPackage, fetchFromGitHub, pytest, pytestrunner, six, future }:

buildPythonPackage rec {
  pname = "textfsm";
  version = "1.1.0";

  src = fetchFromGitHub {
    owner = "google";
    repo = pname;
    rev = "v${version}";
    sha256 = "1jd653srr2xbdlj37nsdg7b7b1wi9577sbn43iq2yrm7vlrbh9xg";
  };

  propgatedBuildInputs = [ six future ];
  checkInputs = [ pytest pytestrunner ];

  meta = with lib; {
    description = ''
      Python modules for parsing semi-structured text into python
      tables.'';
    homepage = "https://pypi.org/project/textfsm/";
    license = licenses.asl20;
    maintainers = [ maintainers.limeytexan ];
  };
}
