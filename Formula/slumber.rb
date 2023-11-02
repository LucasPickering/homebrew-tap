class Slumber < Formula
  desc "Terminal-based HTTP client"
  if Hardware::CPU.type == :arm
    url "https://github.com/LucasPickering/slumber/releases/download/v0.4.0/slumber-aarch64-apple-darwin.tar.xz"
    sha256 "af7f2ab7bb80b447928e9f0cdd97078d3126b7e3a435a4d600ee005e3a1bdd56"
  else
    url "https://github.com/LucasPickering/slumber/releases/download/v0.4.0/slumber-x86_64-apple-darwin.tar.xz"
    sha256 "5c561dfe11c1a065b8806ed1eac70badee8c719934bd561134c0102243964b5e"
  end
  version "0.4.0"
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
