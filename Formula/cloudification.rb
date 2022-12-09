class Cloudification < Formula
  desc "Offload iClouded folders out of the cloud"
  homepage "https://gitlab.com/Frizlab/cloudification"
  url "git@gitlab.com:Frizlab/cloudification.git",
      using:    :git,
      tag:      "0.1.0",
      revision: "1fcb4cdfe034d716f3944a0e7d9922cfd20c5d90"
  head "git@gitlab.com:Frizlab/cloudification.git", using: :git

  depends_on xcode: ["13.1", :build]

  def install
    system "swift", "build", "--disable-sandbox", "--configuration", "release", "--disable-automatic-resolution"

    bin.install "./.build/release/recloudify"
    bin.install "./.build/release/uncloudify"
    bin.install "./.build/release/reuncloudify"
  end

  test do
    system "recloudify", "--help"
    system "uncloudify", "--help"
    system "reuncloudify", "--help"
  end
end
