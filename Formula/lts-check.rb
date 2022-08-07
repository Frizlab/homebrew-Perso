class LtsCheck < Formula
  desc "Check Long Term Storage Files"
  homepage "https://github.com/Frizlab/lts-check"
  url "https://github.com/Frizlab/lts-check.git", using: :git, tag: "1.0.0", revision: "8f00a5d2adb276f0f7325e1d635bcc36dc000742"
  head "https://github.com/Frizlab/lts-check.git", using: :git, branch: "develop"

  depends_on xcode: ["13.4", :build]

  def install
    system "swift", "build", "--disable-sandbox", "--configuration", "release", "--disable-automatic-resolution"

    bins = ["./.build/release/lts-check"]
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
    system bin/"lts-check", "--help"
  end
end
