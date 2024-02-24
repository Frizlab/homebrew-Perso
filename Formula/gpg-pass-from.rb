class GpgPassFrom < Formula
  desc "Run GPG using password from… something"
  homepage "https://gist.github.com/Frizlab/fbd3971a42a4fd07765758b095623377"
  url "https://gist.github.com/fbd3971a42a4fd07765758b095623377.git", using: :git, branch: "main"
  version "1.0"

  def install
    files = Dir["./*.sh"]
    files.each do |f|
      bin.install f => File.basename(f, File.extname(f))
    end
  end
end
