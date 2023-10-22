class Slumber < Formula
  desc "Terminal-based REST client"
  if Hardware::CPU.type == :arm
    url "https://github.com/LucasPickering/slumber/releases/download/v0.3.1/slumber-aarch64-apple-darwin.tar.xz"
    sha256 "6c52e5171402c758ab4f7bacd3a1ac736eb5945f6df3be875dc19955cd2452aa"
  else
    url "https://github.com/LucasPickering/slumber/releases/download/v0.3.1/slumber-x86_64-apple-darwin.tar.xz"
    sha256 "92bfd1606319363f0b084121cdcfca241d6693cbf414e1c8b8ef073c1bd33aca"
  end
  version "0.3.1"
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
