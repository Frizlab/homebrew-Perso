class Luxaforctl < Formula
  desc "Send commands to a USB-connected Luxafor flag"
  homepage "https://github.com/Frizlab/swift-luxafor"
  url "https://github.com/Frizlab/swift-luxafor.git", using: :git, tag: "0.1.0", revision: "af21c81c193ac54ba112791d4f7d38260bdf1c81"
  head "https://github.com/Frizlab/swift-luxafor.git", using: :git, branch: "develop"

  depends_on xcode: ["13.4", :build]

  def install
    system "swift", "build", "--disable-sandbox", "--configuration", "release", "--disable-automatic-resolution"

    bins = ["./.build/release/luxaforctl"]
    bins.each do |b|
      # Generate and install bash completion.
      output = Utils.safe_popen_read(b, "--generate-completion-script", "bash")
      (bash_completion/File.basename(b)).write output
      # Generate and install zsh completion.
      output = Utils.safe_popen_read(b, "--generate-completion-script", "zsh")
      (zsh_completion/("_" + File.basename(b))).write output
      # Generate and install fish completion.
      output = Utils.safe_popen_read(b, "--generate-completion-script", "fish")
      (fish_completion/File.basename(b)).write output

      # Install the binary after completion is generated.
      bin.install b
    end
  end

  test do
    system bin/"luxaforctl", "--help"
  end
end
