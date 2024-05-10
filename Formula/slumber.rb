class Slumber < Formula
  desc "Terminal-based HTTP client"
  homepage "https://slumber.lucaspickering.me"
  version "1.2.0"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/LucasPickering/slumber/releases/download/v1.2.0/slumber-aarch64-apple-darwin.tar.xz"
      sha256 "298a91ed6c11438df57e53b00731a2ec3438855fdcee9d70735cab5c96d2904e"
    end
    if Hardware::CPU.intel?
      url "https://github.com/LucasPickering/slumber/releases/download/v1.2.0/slumber-x86_64-apple-darwin.tar.xz"
      sha256 "8f03bb7d6847e5fb58aba341da9c0a7023b55aff8d9fbdfcabe2b35570f56496"
    end
  end
  if OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/LucasPickering/slumber/releases/download/v1.2.0/slumber-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "5cca9eccb7b83f36039c8515d0e38628c931fbb0744ee2ee5743893d864431f6"
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
