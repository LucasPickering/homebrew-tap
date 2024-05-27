class Slumber < Formula
  desc "Terminal-based HTTP client"
  homepage "https://slumber.lucaspickering.me"
  version "1.3.2"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/LucasPickering/slumber/releases/download/v1.3.2/slumber-aarch64-apple-darwin.tar.xz"
      sha256 "84448f2d0c14506c95725131777b67a13b07acae488e9593745999b30d3c6407"
    end
    if Hardware::CPU.intel?
      url "https://github.com/LucasPickering/slumber/releases/download/v1.3.2/slumber-x86_64-apple-darwin.tar.xz"
      sha256 "4a0c86891f63b9d44bc4c2a808448434e86c48d90597d1cb9b60bbf25545798e"
    end
  end
  if OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/LucasPickering/slumber/releases/download/v1.3.2/slumber-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "c05e114aaa62f4325274209a3007290af1e5aa45b1b77d76b375dfe550f34023"
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
