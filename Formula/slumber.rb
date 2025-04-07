class Slumber < Formula
  desc "Terminal-based HTTP client"
  homepage "https://slumber.lucaspickering.me"
  version "3.1.0"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/LucasPickering/slumber/releases/download/v3.1.0/slumber-aarch64-apple-darwin.tar.xz"
      sha256 "ae74a561b960becfc918d8f74f5dd286a7b82669cf2b7cc5d2c7c044437cdaf9"
    end
    if Hardware::CPU.intel?
      url "https://github.com/LucasPickering/slumber/releases/download/v3.1.0/slumber-x86_64-apple-darwin.tar.xz"
      sha256 "a808510c700ad66ae02487017a8e1333db679ca7b2e686c38650e6426b7f15de"
    end
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/LucasPickering/slumber/releases/download/v3.1.0/slumber-x86_64-unknown-linux-gnu.tar.xz"
    sha256 "c4220a341cdcb5c1ca32b369929419e0bc2ba769a082509f62741a25fdbf06c1"
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
