class EnvSelect < Formula
  desc "Easily switch between common values for arbitrary environment variables"
  version "1.0.0"
  on_macos do
    on_arm do
      url "https://github.com/LucasPickering/env-select/releases/download/v1.0.0/env-select-aarch64-apple-darwin.tar.xz"
      sha256 "3cd619876c2618e0e9b05ff70bb48c7e51c76a7aded27147ec8c51fdc64e73b8"
    end
    on_intel do
      url "https://github.com/LucasPickering/env-select/releases/download/v1.0.0/env-select-x86_64-apple-darwin.tar.xz"
      sha256 "95afaa884eb679f9ed10a70f799370a917b812abd8b7796c598006370b214e0c"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/LucasPickering/env-select/releases/download/v1.0.0/env-select-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "65e34007d6b3100b436eed1f33c8d764838ad60012c0240452809b6dbbd78b25"
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
