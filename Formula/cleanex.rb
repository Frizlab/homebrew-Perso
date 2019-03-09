class Cleanex < Formula
  desc "Visualise your files in a tree map"
  homepage "https://www.perdu.com"
  head "file:///Users/frizlab/Documents/Never%20Ending/Local.nosync/git/cleanex.git", :using => :git

  def install
    # I would love to be able to copy "." and link to cleanex/cleanex but I did
    # not find the way. Currently if cleanex depends on a .something file or
    # folder, it won't work (this should't happen, but still I don't like it).
    libexec.install Dir["*"]
    bin.write_exec_script(libexec/"cleanex")
  end
end
