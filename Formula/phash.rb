# Note: There was a patch for the 0.9.4 version of pHash to
# make it compile with latest ffmpeg:
#    https://github.com/Homebrew/legacy-homebrew/commit/f0ff10803438a19e8955f941974cc23435d44603
#
# Note sure it's worth digging into though...

class Phash < Formula
  desc "Perceptual hash library"
  homepage "http://www.phash.org/"
  url "http://phash.org/releases/pHash-0.9.6.tar.gz"
  sha256 "3c8258a014f9c2491fb1153010984606805638a45d00498864968a9a30102935"

  option "without-image-hash", "Disable image hash"
  option "without-video-hash", "Disable video hash"
  option "without-audio-hash", "Disable audio hash"

  depends_on "cimg" if build.with?("image-hash") || build.with?("video-hash")
  depends_on "ffmpeg@2.8" if build.with? "video-hash"

  if build.with? "audio-hash"
    depends_on "libsndfile"
    depends_on "libsamplerate"
    depends_on "mpg123"
  end

  def install
    inreplace "src/ph_fft.h", "/usr/include/complex.h", "#{MacOS.sdk_path}/usr/include/complex.h"

    args = %W[
      --disable-debug
      --disable-dependency-tracking
      --prefix=#{prefix}
      --enable-shared
    ]

    args << "--disable-image-hash" if build.without? "image-hash"
    args << "--disable-video-hash" if build.without? "video-hash"
    args << "--disable-audio-hash" if build.without? "audio-hash"

    if build.with? "video-hash"
      ENV.append "LDFLAGS", "-L#{HOMEBREW_PREFIX}/opt/ffmpeg@2.8/lib"
      ENV.append "CPPFLAGS", "-I#{HOMEBREW_PREFIX}/opt/ffmpeg@2.8/include/**"
    end

    system "./configure", *args
    system "make", "install"
  end
end
