class Flam3 < Formula
  desc "Flames are algorithmically generated images and animations."
  homepage "https://github.com/scottdraves/flam3"
  url "https://github.com/scottdraves/flam3/archive/v3.1.1.tar.gz"
  sha256 "afcd4af13897740e34f6ae1f3061bbfbda9c1dd5df3ecc9f57141c985d35d19d"

  depends_on "autoconf" => :build
  depends_on "automake" => :build
  depends_on "pkg-config" => :build
  depends_on "libpng@1.2"

  def install
    system "./configure", "--disable-dependency-tracking", "--prefix=#{prefix}"
    system "make", "install"
  end

  test do
    system "test", "-x", "#{bin}/flam3-render"
  end
end
