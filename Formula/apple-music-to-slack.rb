class AppleMusicToSlack < Formula
  desc "Set your Slack status from the music you’re listening to"
  homepage "https://github.com/Frizlab/apple-music-to-slack"
  url "https://github.com/Frizlab/apple-music-to-slack.git",
      tag:      "1.0.0-beta.3",
      revision: "6365e10d954c96614c0f639d5cda699c0e3c2092"
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
