class Slumber < Formula
  desc "Terminal-based HTTP client"
  if Hardware::CPU.type == :arm
    url "https://github.com/LucasPickering/slumber/releases/download/v0.14.0/slumber-aarch64-apple-darwin.tar.xz"
    sha256 "24cd1a203ffadbed33e16b155db4e22c50d7acf5276588db0a9ee78cf5cdaa02"
  else
    url "https://github.com/LucasPickering/slumber/releases/download/v0.14.0/slumber-x86_64-apple-darwin.tar.xz"
    sha256 "6aa7bcff18643860b43208fbbebd2d22776a67de256aaf774386c617335eb679"
  end
  version "0.14.0"
  license "MIT"

  def install
    bin.install "slumber"

    # Homebrew will automatically install these, so we don't need to do that
    doc_files = Dir["README.*", "readme.*", "LICENSE", "LICENSE.*", "CHANGELOG.*"]
    leftover_contents = Dir["*"] - doc_files

    # Install any leftover files in pkgshare; these are probably config or
    # sample files.
    pkgshare.install *leftover_contents unless leftover_contents.empty?
  end
end
