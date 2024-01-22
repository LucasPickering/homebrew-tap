class Slumber < Formula
  desc "Terminal-based HTTP client"
  if Hardware::CPU.type == :arm
    url "https://github.com/LucasPickering/slumber/releases/download/v0.12.1/slumber-aarch64-apple-darwin.tar.xz"
    sha256 "c9e98434fbfb1f7c3c5ba081255252e78cd64ca9cc56fcfe25dd29ce8000754e"
  else
    url "https://github.com/LucasPickering/slumber/releases/download/v0.12.1/slumber-x86_64-apple-darwin.tar.xz"
    sha256 "6333367f04166ebcf95a9f8483dcc8659a294616aee508ad81624857c0e6ef69"
  end
  version "0.12.1"
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
