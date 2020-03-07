class PayfitPayrollDownloader < Formula
  desc "Download PayFit Payrolls automatically"
  homepage "https://github.com/Frizlab/PayFitPayrollDownloader"
  url "https://github.com/Frizlab/PayFitPayrollDownloader.git", :tag => "1.2"

  depends_on :xcode => ["11.3", :build]

  def install
    xcodebuild "archive", "-project", "test_payfit.xcodeproj", "-scheme", "test_payfit",
      "-configuration", "Release", "-archivePath", "#{buildpath}/archive.xcarchive", "SYMROOT=build"
    bin.install "#{buildpath}/archive.xcarchive/Products/usr/local/bin/test_payfit" => "payfit_payroll_downloader"
  end

  test do
    system "true" # payfit_payroll_downloader does not have a --version or otherwise
  end
end
