class Slumber < Formula
  desc "Terminal-based HTTP client"
  if Hardware::CPU.type == :arm
    url "https://github.com/LucasPickering/slumber/releases/download/v0.15.0/slumber-aarch64-apple-darwin.tar.xz"
    sha256 "155cd06065c7979db372311cd4cf6e9f00bbc98fbea3ce7d1138cc4ef567c228"
  else
    url "https://github.com/LucasPickering/slumber/releases/download/v0.15.0/slumber-x86_64-apple-darwin.tar.xz"
    sha256 "1fd566e558e56f3c88052eb4fa160044dc8b7ff92eb22145d7d7bc6c6448a6c9"
  end
  version "0.15.0"
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
