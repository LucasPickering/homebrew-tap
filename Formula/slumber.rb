class Slumber < Formula
  desc "Terminal-based HTTP client"
  homepage "https://slumber.lucaspickering.me"
  version "1.1.0"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/LucasPickering/slumber/releases/download/v1.1.0/slumber-aarch64-apple-darwin.tar.xz"
      sha256 "2496f50936b2b01679aa62716844dd155dfd89d9f9a7c39655a1620f0c6822f1"
    end
    if Hardware::CPU.intel?
      url "https://github.com/LucasPickering/slumber/releases/download/v1.1.0/slumber-x86_64-apple-darwin.tar.xz"
      sha256 "be7f0dee63a3f181e95372b8a38b40bb54ff6d14a6d0fb58b0695db7c5753524"
    end
  end
  if OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/LucasPickering/slumber/releases/download/v1.1.0/slumber-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "ea31f37c4ed0fb04f608c021436d74983c018d6957c3a503f10d37e2f5994917"
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
