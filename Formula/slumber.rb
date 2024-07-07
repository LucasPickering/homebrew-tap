class Slumber < Formula
  desc "Terminal-based HTTP client"
  homepage "https://slumber.lucaspickering.me"
  version "1.6.0"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/LucasPickering/slumber/releases/download/v1.6.0/slumber-aarch64-apple-darwin.tar.xz"
      sha256 "3c4ee18b9a76fc842cb0ec8267f1f15ecdf7dc0af9ae2e97d79cbfd2b7bf3b91"
    end
    if Hardware::CPU.intel?
      url "https://github.com/LucasPickering/slumber/releases/download/v1.6.0/slumber-x86_64-apple-darwin.tar.xz"
      sha256 "3f76de3ad7f5d31eb213727f11039088d32363712b67f8bdfa0e3e280f103ff0"
    end
  end
  if OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/LucasPickering/slumber/releases/download/v1.6.0/slumber-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "8be642eae788efb0adb5b0db99478a384a3226a5b7a085f8a9eaad4570b767ad"
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
