class FindUnreferencedXcodeFiles < Formula
  desc "Find files in your repo but not in your xcodeproj"
  homepage "https://github.com/Frizlab/find-unreferenced-xcode-files"
  url "https://github.com/Frizlab/find-unreferenced-xcode-files.git",
      :tag      => "1.0.1",
      :revision => "fae9fbb82ce9a29691e45862e939c4cca5580b08"
  head "https://github.com/Frizlab/find-unreferenced-xcode-files.git"

  depends_on :xcode => ["10.1", :build]

  def install
    system "swift", "build", "--disable-sandbox", "--configuration", "release", "--disable-automatic-resolution"

    bin.install "./.build/release/find-unreferenced-xcode-files"
  end

  test do
    system "true" # find-unreferenced-xcode-files does not have a --version or otherwise
  end
end
