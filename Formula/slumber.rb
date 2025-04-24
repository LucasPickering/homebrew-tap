class Slumber < Formula
  desc "Terminal-based HTTP client"
  homepage "https://slumber.lucaspickering.me"
  version "3.1.1"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/LucasPickering/slumber/releases/download/v3.1.1/slumber-aarch64-apple-darwin.tar.xz"
      sha256 "121c7448dfe2015d4335fe5ab2b6ec3683188553796414310440d041a55a6bd2"
    end
    if Hardware::CPU.intel?
      url "https://github.com/LucasPickering/slumber/releases/download/v3.1.1/slumber-x86_64-apple-darwin.tar.xz"
      sha256 "7642ef0d6a7d21c6f3bee74b7596737bb1aee538be9aefd79be7d25e024e5bb0"
    end
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/LucasPickering/slumber/releases/download/v3.1.1/slumber-x86_64-unknown-linux-gnu.tar.xz"
    sha256 "e625b14a840624750a0a602d2d55ca3da6f0a8a6a8e0200d44cffe489e729020"
  end
  license "MIT"

  BINARY_ALIASES = {
    "aarch64-apple-darwin":              {},
    "x86_64-apple-darwin":               {},
    "x86_64-pc-windows-gnu":             {},
    "x86_64-unknown-linux-gnu":          {},
    "x86_64-unknown-linux-musl-dynamic": {},
    "x86_64-unknown-linux-musl-static":  {},
  }.freeze

  def target_triple
    cpu = Hardware::CPU.arm? ? "aarch64" : "x86_64"
    os = OS.mac? ? "apple-darwin" : "unknown-linux-gnu"

    "#{cpu}-#{os}"
  end

  def install_binary_aliases!
    BINARY_ALIASES[target_triple.to_sym].each do |source, dests|
      dests.each do |dest|
        bin.install_symlink bin/source.to_s => dest
      end
    end
  end

  def install
    bin.install "slumber" if OS.mac? && Hardware::CPU.arm?
    bin.install "slumber" if OS.mac? && Hardware::CPU.intel?
    bin.install "slumber" if OS.linux? && Hardware::CPU.intel?

    install_binary_aliases!

    # Homebrew will automatically install these, so we don't need to do that
    doc_files = Dir["README.*", "readme.*", "LICENSE", "LICENSE.*", "CHANGELOG.*"]
    leftover_contents = Dir["*"] - doc_files

    # Install any leftover files in pkgshare; these are probably config or
    # sample files.
    pkgshare.install(*leftover_contents) unless leftover_contents.empty?
  end
end
