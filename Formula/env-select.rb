class EnvSelect < Formula
  desc "Easily switch between common values for arbitrary environment variables"
  version "1.1.1"
  on_macos do
    on_arm do
      url "https://github.com/LucasPickering/env-select/releases/download/v1.1.1/env-select-aarch64-apple-darwin.tar.xz"
      sha256 "5bdc112ed4be61988b28c8808a34b5bec7b4351ea7208cdb10d32bb68b923d93"
    end
    on_intel do
      url "https://github.com/LucasPickering/env-select/releases/download/v1.1.1/env-select-x86_64-apple-darwin.tar.xz"
      sha256 "0c382338c16917d00a5889139e3c5d937354033f79c732f2aa4b8b43fa6e00fd"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/LucasPickering/env-select/releases/download/v1.1.1/env-select-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "414e08a2617aa7315c53591e57c0d9c8a9b0db8353f09e1fbe8e167540f73558"
    end
  end
  license "MIT"

  def install
    bin.install "es"

    # Homebrew will automatically install these, so we don't need to do that
    doc_files = Dir["README.*", "readme.*", "LICENSE", "LICENSE.*", "CHANGELOG.*"]
    leftover_contents = Dir["*"] - doc_files

    # Install any leftover files in pkgshare; these are probably config or
    # sample files.
    pkgshare.install *leftover_contents unless leftover_contents.empty?
  end
end
