class Slumber < Formula
  desc "Terminal-based HTTP client"
  if Hardware::CPU.type == :arm
    url "https://github.com/LucasPickering/slumber/releases/download/v0.13.0/slumber-aarch64-apple-darwin.tar.xz"
    sha256 "bd820f432067138168f1252439406f3cb2b52d15a9c64e1b747bf7175671317e"
  else
    url "https://github.com/LucasPickering/slumber/releases/download/v0.13.0/slumber-x86_64-apple-darwin.tar.xz"
    sha256 "2a31a495526cdcea480f82f21948706851d152a3f3b4f8f8aa1bd88f9643ed9a"
  end
  version "0.13.0"
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
