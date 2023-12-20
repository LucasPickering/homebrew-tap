class Slumber < Formula
  desc "Terminal-based HTTP client"
  if Hardware::CPU.type == :arm
    url "https://github.com/LucasPickering/slumber/releases/download/v0.11.0/slumber-aarch64-apple-darwin.tar.xz"
    sha256 "b34b0f465a88a71c7033a5855413210672e76d74de417e5fc7543afb0f70e7e0"
  else
    url "https://github.com/LucasPickering/slumber/releases/download/v0.11.0/slumber-x86_64-apple-darwin.tar.xz"
    sha256 "1923f58f9d88af74a132816891d196b76bb81f27d290d53e88039cf4e9aca3c5"
  end
  version "0.11.0"
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
