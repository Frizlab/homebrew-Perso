require "formula"

class CvspsAT2 < Formula
  homepage "https://web.archive.org/web/20160127055537/http://www.cobite.com/cvsps/"
  url "https://mirrors.ocf.berkeley.edu/debian/pool/main/c/cvsps/cvsps_2.1.orig.tar.gz"
  mirror "https://mirrorservice.org/sites/ftp.debian.org/debian/pool/main/c/cvsps/cvsps_2.1.orig.tar.gz"
  mirror "https://web.archive.org/web/20160127055537/http://www.cobite.com/cvsps/cvsps-2.1.tar.gz"
  sha256 "91d3198b33463861a581686d5fcf99a5c484e7c4d819384c04fda9cafec1075a"

  def install
    system "make", "all"
    system "make", "install", "prefix=#{prefix}"
  end
end
