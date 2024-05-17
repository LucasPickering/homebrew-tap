class Slumber < Formula
  desc "Terminal-based HTTP client"
  homepage "https://slumber.lucaspickering.me"
  version "1.3.0"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/LucasPickering/slumber/releases/download/v1.3.0/slumber-aarch64-apple-darwin.tar.xz"
      sha256 "0ab5ec01495720ee0357de5a514ebd64435f98b57e1061d54fb79f8f8cb0aa0a"
    end
    if Hardware::CPU.intel?
      url "https://github.com/LucasPickering/slumber/releases/download/v1.3.0/slumber-x86_64-apple-darwin.tar.xz"
      sha256 "f1e5cf8d3893f34cd0290df6c77f6522f14ea47edd27110f8d0d090ef794bcfc"
    end
  end
  if OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/LucasPickering/slumber/releases/download/v1.3.0/slumber-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "cb41366a5e6c52a3071d72384441ea08f1315e55f2f730d8c4bae810b2a34916"
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
