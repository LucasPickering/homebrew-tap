class EnvSelect < Formula
  desc "Easily switch between common values for arbitrary environment variables"
  version "0.12.0"
  on_macos do
    on_arm do
      url "https://github.com/LucasPickering/env-select/releases/download/v0.12.0/env-select-aarch64-apple-darwin.tar.xz"
      sha256 "52cc4cc676af96ae93869671271880c8c6204d2f90299153dd2248764dd595a6"
    end
    on_intel do
      url "https://github.com/LucasPickering/env-select/releases/download/v0.12.0/env-select-x86_64-apple-darwin.tar.xz"
      sha256 "286ba53d72e673c58521b18660e40a9ed2f9d534b22ab25f0e9bcd070183bc36"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/LucasPickering/env-select/releases/download/v0.12.0/env-select-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "b89b586a1e406b9e12d3acdfa513e235ac52cbd771f05771d546fe6190c9c6d9"
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
