class Slumber < Formula
  desc "Terminal-based HTTP client"
  homepage "https://slumber.lucaspickering.me"
  version "2.3.0"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/LucasPickering/slumber/releases/download/v2.3.0/slumber-aarch64-apple-darwin.tar.xz"
      sha256 "e1d86e69d3df92c16ad991f38e78932d7caeaaa45610f9356fa0d0993ab9f8fa"
    end
    if Hardware::CPU.intel?
      url "https://github.com/LucasPickering/slumber/releases/download/v2.3.0/slumber-x86_64-apple-darwin.tar.xz"
      sha256 "b267d32714ff0999a7600f4aca60c7cbce5e78e74b289f4d4efa24c4cb0d0e66"
    end
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/LucasPickering/slumber/releases/download/v2.3.0/slumber-x86_64-unknown-linux-gnu.tar.xz"
    sha256 "b8b325cd62e77ce3b911c99bca8fce853e63756b1f9ad283e76e7bb03f0d3cc9"
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
