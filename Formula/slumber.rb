class Slumber < Formula
  desc "Terminal-based HTTP client"
  if Hardware::CPU.type == :arm
    url "https://github.com/LucasPickering/slumber/releases/download/v0.17.0/slumber-aarch64-apple-darwin.tar.xz"
    sha256 "8b8e7be16cb9e72bda43fd7a6e874d3a9f4829c81345b1aab8ae6b484f994ead"
  else
    url "https://github.com/LucasPickering/slumber/releases/download/v0.17.0/slumber-x86_64-apple-darwin.tar.xz"
    sha256 "745144cd9a532fd642eb3a241293fd5c458459495f991431667d2d6c22f1a757"
  end
  version "0.17.0"
  license "MIT"

  def install
    bin.install "slumber"

    # Homebrew will automatically install these, so we don't need to do that
    doc_files = Dir["README.*", "readme.*", "LICENSE", "LICENSE.*", "CHANGELOG.*"]
    leftover_contents = Dir["*"] - doc_files

    # Install any leftover files in pkgshare; these are probably config or
    # sample files.
    pkgshare.install *leftover_contents unless leftover_contents.empty?
  end
end
