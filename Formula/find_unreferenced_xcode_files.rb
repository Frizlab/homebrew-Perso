class FindUnreferencedXcodeFiles < Formula
  desc "Find files in your repo but not in your xcodeproj"
  homepage "https://github.com/Frizlab/find_unreferenced_xcode_files"
  url "https://github.com/Frizlab/find_unreferenced_xcode_files.git",
      :tag      => "1.0.0",
      :revision => "9f00ded69ef1806ea0cf28fe5e953a0f26125914"
  head "https://github.com/Frizlab/find_unreferenced_xcode_files.git"

  depends_on :xcode => ["10.1", :build]

  def install
    xcodebuild "archive", "-project", "find_unreferenced_xcode_files.xcodeproj", "-scheme", "find_unreferenced_xcode_files",
      "-configuration", "Release", "-archivePath", "#{buildpath}/archive.xcarchive", "SYMROOT=build"
    bin.install "#{buildpath}/archive.xcarchive/Products/usr/local/bin/find_unreferenced_xcode_files"
  end

  test do
    system "true" # find_unreferenced_xcode_files does not have a --version or otherwise
  end
end
