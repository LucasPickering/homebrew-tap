class Slumber < Formula
  desc "Terminal-based HTTP client"
  homepage "https://slumber.lucaspickering.me"
  version "1.2.1"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/LucasPickering/slumber/releases/download/v1.2.1/slumber-aarch64-apple-darwin.tar.xz"
      sha256 "4d4d654fcdf19fce0a1739f91d2aee0702bd69bd2485254456e08f1a3f99e06f"
    end
    if Hardware::CPU.intel?
      url "https://github.com/LucasPickering/slumber/releases/download/v1.2.1/slumber-x86_64-apple-darwin.tar.xz"
      sha256 "683e9067bd0f6b29ee750629edebb7edfefb0e5023ff7a2d44b59d25d044d62f"
    end
  end
  if OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/LucasPickering/slumber/releases/download/v1.2.1/slumber-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "2876e1ca9fbacb0c10aa58e20332d12d017a03174ae46ca5b509d7522254acc6"
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
