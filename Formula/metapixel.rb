class Metapixel < Formula
  desc "Generate photomosaics"
  homepage "https://www.complang.tuwien.ac.at/schani/metapixel/"
  url "https://www.complang.tuwien.ac.at/schani/metapixel/files/metapixel-1.0.2.tar.gz"
  sha256 "8d77810978da397c070b9b4e228ae6204e9f5c524518ad1a4fcab9462171f55b"

  depends_on "giflib"
  depends_on "jpeg"
  depends_on "libpng@1.2"

  def install
    system "make"
    # The Makefile does not create the man dir
    mkdir_p man1.to_s
    system "make", "install", "PREFIX=#{prefix}"
  end

  test do
    system "#{bin}/metapixel", "--version"
  end
end
