class LsDiff < Formula
  desc "Find file listing diffs between two folders"
  homepage "https://github.com/Frizlab/ls-diff"
  url "https://github.com/Frizlab/ls-diff.git",
      tag:      "1.0.1",
      revision: "25580d1e376796cc1fa220699b4112e9f76bcab5"
  head "https://github.com/Frizlab/ls-diff.git"

  depends_on xcode: ["12.5", :build]

  def install
    system "swift", "build", "--disable-sandbox", "--configuration", "release", "--disable-automatic-resolution"

    bin.install "./.build/release/ls-diff"
  end

  test do
    system "ls-diff", "--help"
  end
end
