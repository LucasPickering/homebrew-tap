class Slumber < Formula
  desc "Terminal-based HTTP client"
  homepage "https://slumber.lucaspickering.me"
  version "1.8.0"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/LucasPickering/slumber/releases/download/v1.8.0/slumber-aarch64-apple-darwin.tar.xz"
      sha256 "bd596bba4c1da1cc7f94d1d7aaf789a34e8d7305ed3f8047f8f06a44d6d815fd"
    end
    if Hardware::CPU.intel?
      url "https://github.com/LucasPickering/slumber/releases/download/v1.8.0/slumber-x86_64-apple-darwin.tar.xz"
      sha256 "9fd930edeac0a9eedbe59402d2fa322a40ab618a89c4b81bbc7a981d835ba85a"
    end
  end
  if OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/LucasPickering/slumber/releases/download/v1.8.0/slumber-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "b885cbbc2b417d79a6f35027b2ca188d4e97d6c77fe49535c88a6521cead8fce"
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
