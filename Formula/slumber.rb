class Slumber < Formula
  desc "Terminal-based HTTP client"
  if Hardware::CPU.type == :arm
    url "https://github.com/LucasPickering/slumber/releases/download/v0.8.0/slumber-aarch64-apple-darwin.tar.xz"
    sha256 "71d03a28226f0a864a81367cbe040497a49004d9362883df47bdea398b1405a1"
  else
    url "https://github.com/LucasPickering/slumber/releases/download/v0.8.0/slumber-x86_64-apple-darwin.tar.xz"
    sha256 "367e6d7ced538975eb47bdd1477adbbd5cc144525e6f91353265e23d56810aa9"
  end
  version "0.8.0"
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
