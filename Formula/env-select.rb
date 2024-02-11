class EnvSelect < Formula
  desc "Easily switch between common values for arbitrary environment variables"
  version "1.1.2"
  on_macos do
    on_arm do
      url "https://github.com/LucasPickering/env-select/releases/download/v1.1.2/env-select-aarch64-apple-darwin.tar.xz"
      sha256 "46143b95a18cd7d37fafa22a9a12c680edc691d83f2f4052caaa381d487b1cb1"
    end
    on_intel do
      url "https://github.com/LucasPickering/env-select/releases/download/v1.1.2/env-select-x86_64-apple-darwin.tar.xz"
      sha256 "c7021f3dc27b2977b5aac1491deefac0bda47a279b24a2e2dd9debb008ff2685"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/LucasPickering/env-select/releases/download/v1.1.2/env-select-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "41fbae4195010473c8950cd32bcc3aadf2f355a941a348066eb5641fa326c230"
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
