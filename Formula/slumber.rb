class Slumber < Formula
  desc "Terminal-based HTTP client"
  if Hardware::CPU.type == :arm
    url "https://github.com/LucasPickering/slumber/releases/download/v0.13.1/slumber-aarch64-apple-darwin.tar.xz"
    sha256 "797d68a0d9463275da80c2684197688fd351539ebdbf639369e9e63aa8b46a6a"
  else
    url "https://github.com/LucasPickering/slumber/releases/download/v0.13.1/slumber-x86_64-apple-darwin.tar.xz"
    sha256 "99f9ff70fc21d349ce6871ce7bd4a2e9eaba28045d99916b4da74ac4a83cbf4f"
  end
  version "0.13.1"
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
