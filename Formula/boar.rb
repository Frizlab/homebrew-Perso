class Boar < Formula
  desc "SCM for your binaries"
  homepage "https://bitbucket.org/mats_ekberg/boar"
  head "https://bitbucket.org/mats_ekberg/boar", :using => :hg

  depends_on "python@2" # does not support Python 3

  def install
    # I would love to be able to copy "." and link to boar/boar
    # but I did not find the way. Currently if boar depends on a
    # .something file or folder, it won't work (this should't
    # happen, but still I don't like it).
    libexec.install Dir["*"]
    (bin/"boar").write_env_script(libexec/"boar",
      :PYTHONPATH => ENV["PYTHONPATH"])
  end

  test do
    system bin/"boar", "--version"
  end
end
