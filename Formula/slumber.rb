class Slumber < Formula
  desc "Terminal-based HTTP client"
  if Hardware::CPU.type == :arm
    url "https://github.com/LucasPickering/slumber/releases/download/v0.6.0/slumber-aarch64-apple-darwin.tar.xz"
    sha256 "2cd843062462656675e2070bfd311f40f090f2a71e6530160f6786141592a58f"
  else
    url "https://github.com/LucasPickering/slumber/releases/download/v0.6.0/slumber-x86_64-apple-darwin.tar.xz"
    sha256 "e7b27fe605037a95d6f34af6c9babfbdb0fb362edc2c079ed475ef1bc745e2f3"
  end
  version "0.6.0"
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
