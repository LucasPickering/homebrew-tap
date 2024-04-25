class Slumber < Formula
  desc "Terminal-based HTTP client"
  if Hardware::CPU.type == :arm
    url "https://github.com/LucasPickering/slumber/releases/download/v1.0.0/slumber-aarch64-apple-darwin.tar.xz"
    sha256 "f59586722b645d239c97eb3e997d572a7963a762c0388e3730ec24b1f1173d70"
  else
    url "https://github.com/LucasPickering/slumber/releases/download/v1.0.0/slumber-x86_64-apple-darwin.tar.xz"
    sha256 "cf459f30f60e66f9d3d570fb2e977b0624717e52492a6fa1208f3e4b685a47b6"
  end
  version "1.0.0"
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
