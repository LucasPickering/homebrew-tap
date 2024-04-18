class Slumber < Formula
  desc "Terminal-based HTTP client"
  if Hardware::CPU.type == :arm
    url "https://github.com/LucasPickering/slumber/releases/download/v0.18.0/slumber-aarch64-apple-darwin.tar.xz"
    sha256 "ddc6a19948e10078cf8601ca26c696a72d98d541d735dec7caa4720f91a157c7"
  else
    url "https://github.com/LucasPickering/slumber/releases/download/v0.18.0/slumber-x86_64-apple-darwin.tar.xz"
    sha256 "d407ac78329b05fdf346121e36f64834b5bd4620acb615209e5663999d85247f"
  end
  version "0.18.0"
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
