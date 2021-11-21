class Cloudification < Formula
  desc "Offload iClouded folders out of the cloud"
  homepage "https://gitlab.com/Frizlab/cloudification"
  url "git@gitlab.com:Frizlab/cloudification.git",
      using:    :git,
      tag:      "0.0.7",
      revision: "de785029a5a6267f198c4fe3a7b74c88516a240f"
  head "git@gitlab.com:Frizlab/cloudification.git", using: :git

  depends_on xcode: ["13.1", :build]

  def install
    system "swift", "build", "--disable-sandbox", "--configuration", "release", "--disable-automatic-resolution"

    bin.install "./.build/release/recloudify"
    bin.install "./.build/release/uncloudify"
  end

  test do
    system "recloudify", "--help"
    system "uncloudify", "--help"
  end
end
