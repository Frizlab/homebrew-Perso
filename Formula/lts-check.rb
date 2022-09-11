class LtsCheck < Formula
  desc "Check Long Term Storage Files"
  homepage "https://github.com/Frizlab/lts-check"
  url "https://github.com/Frizlab/lts-check.git", using: :git, tag: "1.0.4", revision: "1aa3da41e5a9f65a05aee76904d501aa17566aaf"
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
