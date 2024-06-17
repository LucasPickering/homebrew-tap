class Slumber < Formula
  desc "Terminal-based HTTP client"
  homepage "https://slumber.lucaspickering.me"
  version "1.5.0"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/LucasPickering/slumber/releases/download/v1.5.0/slumber-aarch64-apple-darwin.tar.xz"
      sha256 "dc4ec494ccc24cbbd21df67e4175d02489ed999b6b446b6210b96caf4095ee03"
    end
    if Hardware::CPU.intel?
      url "https://github.com/LucasPickering/slumber/releases/download/v1.5.0/slumber-x86_64-apple-darwin.tar.xz"
      sha256 "46599cf6ea54d5adf68a5f1ed0811879184628fcf0e73c377f671c098a367570"
    end
  end
  if OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/LucasPickering/slumber/releases/download/v1.5.0/slumber-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "0997180882db920486677d39481e13f9fc9296f940f79789979cf26791741c5c"
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
