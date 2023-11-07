class Slumber < Formula
  desc "Terminal-based HTTP client"
  if Hardware::CPU.type == :arm
    url "https://github.com/LucasPickering/slumber/releases/download/v0.5.0/slumber-aarch64-apple-darwin.tar.xz"
    sha256 "6e5e1715f4bde843e1d48476407f443f9946890eebfaa2c98dee80e5197f6c38"
  else
    url "https://github.com/LucasPickering/slumber/releases/download/v0.5.0/slumber-x86_64-apple-darwin.tar.xz"
    sha256 "1e3c017ce7b53e05a36d089eccd9f25f6fcc41f8d6848f0938929639af22ca3c"
  end
  version "0.5.0"
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
