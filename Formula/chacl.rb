class Chacl < Formula
  desc "Set ACL recursively on files and folder from an easy to read configuration"
  homepage "https://github.com/Frizlab/chacl"
  url "https://github.com/Frizlab/chacl.git",
      tag:      "chacl/release/1.1",
      revision: "62c8c93df900a1ea76f61a44fb3b6cc8fb8dd11e"
  head "https://github.com/Frizlab/chacl.git"

  depends_on xcode: ["12.5", :build]

  def install
    system "swift", "build", "--disable-sandbox", "--configuration", "release", "--disable-automatic-resolution"

    bin.install "./.build/release/chacl"
  end

  test do
    system "chacl", "--help"
  end
end
