class Slumber < Formula
  desc "Terminal-based HTTP client"
  homepage "https://slumber.lucaspickering.me"
  version "1.4.0"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/LucasPickering/slumber/releases/download/v1.4.0/slumber-aarch64-apple-darwin.tar.xz"
      sha256 "ac33fc45f8ec0f684ecd9412311fdb1057cb97f2c40bef50291ba0185d3722b5"
    end
    if Hardware::CPU.intel?
      url "https://github.com/LucasPickering/slumber/releases/download/v1.4.0/slumber-x86_64-apple-darwin.tar.xz"
      sha256 "05fc5f1875bd1605705d06d8c3a07bbe0cc6822c628664dda000c79af7cce1ed"
    end
  end
  if OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/LucasPickering/slumber/releases/download/v1.4.0/slumber-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "04c92217d6d01ce089b6c27239aa0f98f94646d24b1835a762a170bb5c94f641"
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
