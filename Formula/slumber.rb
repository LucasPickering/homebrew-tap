class Slumber < Formula
  desc "Terminal-based HTTP client"
  if Hardware::CPU.type == :arm
    url "https://github.com/LucasPickering/slumber/releases/download/v0.12.0/slumber-aarch64-apple-darwin.tar.xz"
    sha256 "b2efd040ac16af1e21d243f59be59a65861900a02f55a8d140533649318b9490"
  else
    url "https://github.com/LucasPickering/slumber/releases/download/v0.12.0/slumber-x86_64-apple-darwin.tar.xz"
    sha256 "0b7759b1e279855f2e8b16fa4c0c2cc3acfe4bb82985f14de7265fbd813cd1a4"
  end
  version "0.12.0"
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
