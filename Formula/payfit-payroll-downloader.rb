class PayfitPayrollDownloader < Formula
  desc "Download PayFit Payrolls automatically"
  homepage "https://github.com/Frizlab/payfit-payroll-downloader"
  url "https://github.com/Frizlab/payfit-payroll-downloader.git", :tag => "1.2.1"

  depends_on :xcode => ["11.3", :build]

  def install
    system "swift", "build", "--disable-sandbox", "--configuration", "release", "--disable-automatic-resolution"

    bin.install "./.build/release/payfit-payroll-downloader"
  end

  test do
    system "true" # payfit_payroll_downloader does not have a --version or otherwise
  end
end
