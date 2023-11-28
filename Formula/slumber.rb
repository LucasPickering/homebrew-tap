class Slumber < Formula
  desc "Terminal-based HTTP client"
  if Hardware::CPU.type == :arm
    url "https://github.com/LucasPickering/slumber/releases/download/v0.9.0/slumber-aarch64-apple-darwin.tar.xz"
    sha256 "8aa4a7e65423548159f3fbcd94deacc99d23d9ee2fd6fd164a69f74cd8edfe80"
  else
    url "https://github.com/LucasPickering/slumber/releases/download/v0.9.0/slumber-x86_64-apple-darwin.tar.xz"
    sha256 "8417c3b25602b41a36ef2e24825761ce8ba0870ff5251035f9875bc95d5cc301"
  end
  version "0.9.0"
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
