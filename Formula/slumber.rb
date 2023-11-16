class Slumber < Formula
  desc "Terminal-based HTTP client"
  if Hardware::CPU.type == :arm
    url "https://github.com/LucasPickering/slumber/releases/download/v0.7.0/slumber-aarch64-apple-darwin.tar.xz"
    sha256 "15cdf290071e57d1c41663440e6fc268b1eeb334b8586a7d408542de0f4d949e"
  else
    url "https://github.com/LucasPickering/slumber/releases/download/v0.7.0/slumber-x86_64-apple-darwin.tar.xz"
    sha256 "36463956d33db3311707a44f868c6514559f533b9fea43a8b3184a74a0e097c3"
  end
  version "0.7.0"
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
