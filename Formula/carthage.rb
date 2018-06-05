class Carthage < Formula
  desc "Decentralized dependency manager for Cocoa"
  homepage "https://github.com/Frizlab/Carthage"
  url "https://github.com/Frizlab/Carthage.git",
      :tag => "0.29.0-Frizlab-Xcode10",
      :revision => "d394c9f20a81279ca72095f8936c9838167662bb",
      :shallow => false
  head "https://github.com/Frizlab/Carthage.git", :shallow => false

  depends_on :xcode => ["9.0", :build]

  def install
    system "make", "prefix_install", "PREFIX=#{prefix}"
    bash_completion.install "Source/Scripts/carthage-bash-completion" => "carthage"
    zsh_completion.install "Source/Scripts/carthage-zsh-completion" => "_carthage"
    fish_completion.install "Source/Scripts/carthage-fish-completion" => "carthage.fish"
  end

  test do
    (testpath/"Cartfile").write 'github "jspahrsummers/xcconfigs"'
    system bin/"carthage", "update"
  end
end
