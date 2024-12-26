class AppleMusicToSlack < Formula
  desc "Set your Slack status from the music you’re listening to"
  homepage "https://github.com/Frizlab/apple-music-to-slack"
  url "https://github.com/Frizlab/apple-music-to-slack.git",
      tag:      "1.0.0-beta.1",
      revision: "5dc280f08ad50ee0349da3482ffac38b8ba9d9ba"
  head "https://github.com/Frizlab/apple-music-to-slack.git"

  depends_on xcode: ["16.2", :build]

  def install
    system "swift", "build", "--disable-sandbox", "--configuration", "release", "--disable-automatic-resolution"
    bin.install "./.build/release/apple-music-to-slack"
  end

  test do
    system "apple-music-to-slack", "--help"
  end
end
