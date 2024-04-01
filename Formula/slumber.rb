class Slumber < Formula
  desc "Terminal-based HTTP client"
  if Hardware::CPU.type == :arm
    url "https://github.com/LucasPickering/slumber/releases/download/v0.16.0/slumber-aarch64-apple-darwin.tar.xz"
    sha256 "b5696dd7a5454cd3b84664874548802acddfdae20decfb21717875cb862a1694"
  else
    url "https://github.com/LucasPickering/slumber/releases/download/v0.16.0/slumber-x86_64-apple-darwin.tar.xz"
    sha256 "775fb60778aa37fe52fc8d78e0588dc63324160888fb8591e07637afc04d16de"
  end
  version "0.16.0"
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
