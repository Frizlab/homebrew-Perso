class Texlive < Formula
  desc "Using the TeX document production system easily."
  homepage "https://www.tug.org/texlive/"
  url "http://private.frostland.fr/~frizlab/texlive-v64248540bee3cb20519337ae707ff8d6c191ac74.tar.bz2"
  version "64248540bee3cb20519337ae707ff8d6c191ac74"
  sha256 "88030715bd5112a6e3354eb1b8bfb7095b84ff85ef7c7072e488202ac563d7ee"

  depends_on "autoconf" => :build
  depends_on "automake" => :build
  depends_on "pkg-config" => :build

  env :std

  def install
    system "./reautoconf"
    ENV.append "TL_INSTALL_DEST", prefix
    system "./Build", "--disable-debug", "--disable-dependency-tracking"

    Dir.chdir(prefix)

    bd = "bin"
    d = Dir.glob("#{bd}/*")
    if d.length != 1
      puts "ERROR: Expecting exactly one directory in #{bd}, got #{d.length}. Failing."
      system "false"
    end
    mv d[0], "#{bd}b"
    rmdir bd
    mv "#{bd}b", bd

    bd = "lib"
    d = Dir.glob("#{bd}/*")
    if d.length != 1
      puts "ERROR: Expecting exactly one directory in #{bd}, got #{d.length}. Failing."
      system "false"
    end
    mv d[0], "#{bd}b"
    rmdir bd
    mv "#{bd}b", bd

    mkdir "share"
    mv "texmf-dist", "share"

    bd = "bin"
    d = Dir.glob("#{bd}/*")
    d.each do|path|
      if File.symlink?(path)
        orig = File.readlink(path)
        orig.gsub!(/^((\.\.\/)*)\.\.\/\.\.\//, '\1../share/')
        ln "-sf", orig, path
      end
    end
  end

  test do
    system "true"
  end
end
