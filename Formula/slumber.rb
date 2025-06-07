class Slumber < Formula
  desc "Terminal-based HTTP client"
  homepage "https://slumber.lucaspickering.me"
  version "3.1.3"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/LucasPickering/slumber/releases/download/v3.1.3/slumber-aarch64-apple-darwin.tar.xz"
      sha256 "17bdaab235af982986e9ecb708c6703d61dd16088fcca161a6426f0991d3ed5a"
    end
    if Hardware::CPU.intel?
      url "https://github.com/LucasPickering/slumber/releases/download/v3.1.3/slumber-x86_64-apple-darwin.tar.xz"
      sha256 "aaf51dbd2cf58e77fd0786f6843ca229bef2fe4ca86d4bba61f06cd0d17650b5"
    end
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/LucasPickering/slumber/releases/download/v3.1.3/slumber-x86_64-unknown-linux-gnu.tar.xz"
    sha256 "022b35a761292cfda575e2a2dce61392431938d20b43bdeb2c4f12138b2e10d1"
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
