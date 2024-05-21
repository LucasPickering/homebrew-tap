class Slumber < Formula
  desc "Terminal-based HTTP client"
  homepage "https://slumber.lucaspickering.me"
  version "1.3.1"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/LucasPickering/slumber/releases/download/v1.3.1/slumber-aarch64-apple-darwin.tar.xz"
      sha256 "8324c2b7eaa5d933e9a52170963e003566c9e9bd4ddcca6981a4b79c98d2158e"
    end
    if Hardware::CPU.intel?
      url "https://github.com/LucasPickering/slumber/releases/download/v1.3.1/slumber-x86_64-apple-darwin.tar.xz"
      sha256 "2f600c99613e47b452bbb8e8f9c99b6bbb6912d486c3fd8aa7dbc067c36b985a"
    end
  end
  if OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/LucasPickering/slumber/releases/download/v1.3.1/slumber-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "ef6adf492216f447529607557d81865feab33c0b0de8187400b71f41e68c8f4f"
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
