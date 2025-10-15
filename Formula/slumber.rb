class Slumber < Formula
  desc "Terminal-based HTTP client"
  homepage "https://slumber.lucaspickering.me"
  version "4.2.0"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/LucasPickering/slumber/releases/download/v4.2.0/slumber-aarch64-apple-darwin.tar.xz"
      sha256 "2e6dc909393520dc4be4f4fbcb65f8cfdb925ff7680d0a609db6b2ab0283b3df"
    end
    if Hardware::CPU.intel?
      url "https://github.com/LucasPickering/slumber/releases/download/v4.2.0/slumber-x86_64-apple-darwin.tar.xz"
      sha256 "ce48e9a26be52aad4091ea4f258b2998814784418dc380d024baa4f7c704dace"
    end
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/LucasPickering/slumber/releases/download/v4.2.0/slumber-x86_64-unknown-linux-gnu.tar.xz"
    sha256 "43eb284c5eaa3477baaccd43216c1bce95dc2f0d9757dc62e6e64c4fd0a27d04"
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
