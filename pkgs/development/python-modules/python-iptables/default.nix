{ lib, fetchPypi, buildPythonPackage, iptables }:

buildPythonPackage rec {
  pname = "python-iptables";
  version = "0.14.0";

  src = fetchPypi {
    inherit pname version;
    sha256 = "03dicl5sz66vxc74nclswzdhxg21p5x89hkkm8v794axmm83ick1";
  };

  # This module is heinous - it needs to have the location of iptables
  # embedded in its own logic for finding shared objects.
  postUnpack = ''
    cd $pname-*
    sed -i '/IPTABLES_LIBDIR/ s%os.environ.get(.IPTABLES_LIBDIR., None)%os.environ.get("IPTABLES_LIBDIR", "${iptables.out}/lib")%' iptc/util.py
    sed -i '/XTABLES_LIBDIR/ s%os.getenv("XTABLES_LIBDIR")%os.getenv("XTABLES_LIBDIR","${iptables.out}/lib/xtables")%' iptc/xtables.py
    cd ..
  '';

  propagatedBuildInputs = [ iptables ];

  # Cannot import tests module?
  doCheck = false;

  meta = with lib; {
    homepage = "https://github.com/ldx/python-iptables";
    description =
      "Iptables is the tool that is used to manage netfilter, the standard packet filtering and manipulation framework under Linux";
    license = licenses.asl20;
    maintainers = with maintainers; [ limeytexan ];
  };
}
