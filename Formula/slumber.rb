class Slumber < Formula
  desc "Terminal-based HTTP client"
  homepage "https://slumber.lucaspickering.me"
  version "1.0.1"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/LucasPickering/slumber/releases/download/v1.0.1/slumber-aarch64-apple-darwin.tar.xz"
      sha256 "b4f94d3e8bad526c86aa74d398716dde2e8aa8d92a06128feb043775715ede85"
    end
    if Hardware::CPU.intel?
      url "https://github.com/LucasPickering/slumber/releases/download/v1.0.1/slumber-x86_64-apple-darwin.tar.xz"
      sha256 "cc28c295447cff1c79ebf45de253945808c13d038f6f885fc8cd42fd2a7b258a"
    end
  end
  if OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/LucasPickering/slumber/releases/download/v1.0.1/slumber-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "e25e1a7a42bfc36dd864acab0622272ade8e8c275272504579dd732758c94a72"
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
