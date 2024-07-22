class Slumber < Formula
  desc "Terminal-based HTTP client"
  homepage "https://slumber.lucaspickering.me"
  version "1.7.0"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/LucasPickering/slumber/releases/download/v1.7.0/slumber-aarch64-apple-darwin.tar.xz"
      sha256 "6d85207f81166e7cd676455f2230e78b02479a5408d33b1f7b4f40ebe4c1ccd6"
    end
    if Hardware::CPU.intel?
      url "https://github.com/LucasPickering/slumber/releases/download/v1.7.0/slumber-x86_64-apple-darwin.tar.xz"
      sha256 "83f76b032b6ede9d384c4f3d04ceba4c95ab7831f7de2b43a4bfb223ed0a057a"
    end
  end
  if OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/LucasPickering/slumber/releases/download/v1.7.0/slumber-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "095ef9bd7a2dc6307b6cf97f7c92f1425c9e64ec064409b22570d0f00a379d3b"
    end
  end
  license "MIT"

  def install
    if OS.mac? && Hardware::CPU.arm?
      bin.install "slumber"
    end
    if OS.mac? && Hardware::CPU.intel?
      bin.install "slumber"
    end
    if OS.linux? && Hardware::CPU.intel?
      bin.install "slumber"
    end

    # Homebrew will automatically install these, so we don't need to do that
    doc_files = Dir["README.*", "readme.*", "LICENSE", "LICENSE.*", "CHANGELOG.*"]
    leftover_contents = Dir["*"] - doc_files

    # Install any leftover files in pkgshare; these are probably config or
    # sample files.
    pkgshare.install(*leftover_contents) unless leftover_contents.empty?
  end
end
