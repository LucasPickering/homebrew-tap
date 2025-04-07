class SlumberCli < Formula
  desc "Command line interface for Slumber. Not intended for external use."
  homepage "https://slumber.lucaspickering.me"
  version "3.1.0"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/LucasPickering/slumber/releases/download/v3.1.0/slumber_cli-aarch64-apple-darwin.tar.xz"
      sha256 "4c68362c0cbc8a2a1eaa7dcbb6915890e8471e497154dfaa015d8514e06eecd4"
    end
    if Hardware::CPU.intel?
      url "https://github.com/LucasPickering/slumber/releases/download/v3.1.0/slumber_cli-x86_64-apple-darwin.tar.xz"
      sha256 "89c8262cf8cfbebe8e87bd3c2316554871b3c5efa57c1fe0a5a4ac63f97762db"
    end
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/LucasPickering/slumber/releases/download/v3.1.0/slumber_cli-x86_64-unknown-linux-gnu.tar.xz"
    sha256 "a366d8bfe6d6504fe2bcac56c90e6b00dbc9c85163f80f15499315caa1ef8b60"
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
    bin.install "slumber_cli" if OS.mac? && Hardware::CPU.arm?
    bin.install "slumber_cli" if OS.mac? && Hardware::CPU.intel?
    bin.install "slumber_cli" if OS.linux? && Hardware::CPU.intel?

    install_binary_aliases!

    # Homebrew will automatically install these, so we don't need to do that
    doc_files = Dir["README.*", "readme.*", "LICENSE", "LICENSE.*", "CHANGELOG.*"]
    leftover_contents = Dir["*"] - doc_files

    # Install any leftover files in pkgshare; these are probably config or
    # sample files.
    pkgshare.install(*leftover_contents) unless leftover_contents.empty?
  end
end
