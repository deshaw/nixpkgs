{ lib, fetchPypi, buildPythonPackage, flask, nose }:

buildPythonPackage rec {
  pname = "Flask-XML-RPC";
  version = "0.1.2";

  src = fetchPypi {
    inherit pname version;
    sha256 = "1dwalj7pc5iid9l1k50q5mllirnn9f5s7jq54a66x48a4j179p2a";
  };

  nativeBuildInputs = [ nose ];
  propagatedBuildInputs = [ flask ];

  meta = with lib; {
    description = "An extension for Flask that makes it easy to create APIs based on the XML-RPC standard";
    homepage = "https://bitbucket.org/leafstorm/flask-xml-rpc/";
    license = licenses.mit;
    maintainers = [ maintainers.limeytexan ];
  };
}
