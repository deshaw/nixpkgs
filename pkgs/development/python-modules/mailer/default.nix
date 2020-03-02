{ stdenv, buildPythonPackage, fetchPypi, isPy3k}:

buildPythonPackage rec {
  pname = "mailer";
  version = "0.8.1";

  src = fetchPypi {
    inherit pname version;
    sha256 = "03h7c2c3wz6nfhab3pszp74723cdrjd4s6dbg59hs7kkjwhs249l";
    extension = "zip";
  };

  # Check fails on py3. Runs but usells in Py2
  doCheck = !isPy3k;

  meta = with stdenv.lib; {
    description = "Wraps the standard library smtplib and email modules to provide a friendlier interface for sending email";
    homepage = "https://bitbucket.org/ginstrom/mailer";
    license = licenses.mit;
    maintainers = [ maintainers.limeytexan ];
  };
}
