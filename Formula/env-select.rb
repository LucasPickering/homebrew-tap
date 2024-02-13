class EnvSelect < Formula
  desc "Easily switch between common values for arbitrary environment variables"
  version "1.1.3"
  on_macos do
    on_arm do
      url "https://github.com/LucasPickering/env-select/releases/download/v1.1.3/env-select-aarch64-apple-darwin.tar.xz"
      sha256 "4b52f3eb4ec8bdf015ce62a508197b7f7594e3fd77810271402a97dad4d83e79"
    end
    on_intel do
      url "https://github.com/LucasPickering/env-select/releases/download/v1.1.3/env-select-x86_64-apple-darwin.tar.xz"
      sha256 "d7ca3651301888eac969069439e48a2be83a61e01fed9cc587fec4fdc3f4542f"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/LucasPickering/env-select/releases/download/v1.1.3/env-select-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "55af1a20374280bccdc386b241178ea3c37aa8bc9bfa76222b888933b4141370"
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
