{ lib, fetchPypi, buildPythonPackage, libnetfilter_conntrack }:

buildPythonPackage rec {
  pname = "pynetfilter_conntrack";
  version = "0.7";

  src = fetchPypi {
    inherit pname version;
    sha256 = "08xz99ds6jvsc3i9wi2iwxys68q6h3xiq5pa8jb0jim7ybqxa6vg";
  };
  patches = [ ./desco.patch ];	# XXX Send enhancement upstream???

  propagatedBuildInputs = [ libnetfilter_conntrack ];

  # ctypes.util.find_library() is a pain to work around, but easily done
  postUnpack = ''
    cd $sourceRoot
    sed -i \
      -e 's%util.find_library("netfilter_conntrack")%"${libnetfilter_conntrack}/lib/libnetfilter_conntrack.so"%' \
      pynetfilter_conntrack/func.py
    cd ..
  '';

  meta = with lib; {
    description = "Python binding of the libnetfilter_conntrack library to manage Linux firewall NetFilter";
    homepage    = "https://github.com/regit/pynetfilter_conntrack/";
    license     = licenses.gpl3;
    maintainers = with maintainers; [ limeytexan ];
  };
}
