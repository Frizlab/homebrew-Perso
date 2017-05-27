require "formula"

class Flam3 < Formula
  homepage "https://github.com/scottdraves/flam3"
  url "https://github.com/scottdraves/flam3/archive/v3.0.1.tar.gz"
  sha256 "fc9e936fb5c6cfa05afc94cf9b991259cb9f9d40c2681d2761e5a06dd5afdc9c"

  depends_on "libpng@1.2"
  depends_on "autoconf" => :build
  depends_on "automake" => :build
  depends_on "pkg-config" => :build

  def install
#    ENV.append "LDFLAGS", "-L/usr/local/opt/libpng12/lib"
#    ENV.append "CPPFLAGS", "-I/usr/local/opt/libpng12/include"

    system "./configure", "--disable-dependency-tracking", "--prefix=#{prefix}"
    system "make", "install"
  end

  test do
    system "test -x #{bin}/flam3-render"
  end
end
