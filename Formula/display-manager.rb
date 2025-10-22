class DisplayManager < Formula
  desc "Change the mode (resolution) of your display from the command-line"
  homepage "https://github.com/Frizlab/display-manager"
  url "https://github.com/Frizlab/display-manager.git",
      tag:      "0.1.0",
      revision: "20ca3a11aa58aa4e12208be521b59fcd2cc4f792"
  head "https://github.com/Frizlab/display-manager.git"

  depends_on xcode: ["14.2", :build]

  def install
    system "swift", "build", "--disable-sandbox", "--configuration", "release", "--disable-automatic-resolution"

    bin.install "./.build/release/display-manager"
  end

  test do
    system "display-manager", "--help"
  end
end
