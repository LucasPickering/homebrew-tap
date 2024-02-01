class EnvSelect < Formula
  desc "Easily switch between common values for arbitrary environment variables"
  version "1.0.0"
  on_macos do
    on_arm do
      url "https://github.com/LucasPickering/env-select/releases/download/v1.0.0/env-select-aarch64-apple-darwin.tar.xz"
      sha256 "f72997478f4bf28b705734610ce19137249a76be8070c023f36821ad34183c17"
    end
    on_intel do
      url "https://github.com/LucasPickering/env-select/releases/download/v1.0.0/env-select-x86_64-apple-darwin.tar.xz"
      sha256 "35a72da33182fdccca104381b24366369203ffd072bccc642ff9157e54e59fa1"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/LucasPickering/env-select/releases/download/v1.0.0/env-select-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "24748582427a7fcbb25b986cbe630a786d89b82df0b20ba1f05bd1d5470f86f1"
    end
  end
  license "MIT"

  def install
    bin.install "env-select"

    # Homebrew will automatically install these, so we don't need to do that
    doc_files = Dir["README.*", "readme.*", "LICENSE", "LICENSE.*", "CHANGELOG.*"]
    leftover_contents = Dir["*"] - doc_files

    # Install any leftover files in pkgshare; these are probably config or
    # sample files.
    pkgshare.install *leftover_contents unless leftover_contents.empty?
  end
end
