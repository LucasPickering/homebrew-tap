class EnvSelect < Formula
  desc "Easily switch between common values for arbitrary environment variables"
  version "1.1.0"
  on_macos do
    on_arm do
      url "https://github.com/LucasPickering/env-select/releases/download/v1.1.0/env-select-aarch64-apple-darwin.tar.xz"
      sha256 "33abd6a962621f01b592c06b39a778de78189618866ccc96c4104513c5fdf0ad"
    end
    on_intel do
      url "https://github.com/LucasPickering/env-select/releases/download/v1.1.0/env-select-x86_64-apple-darwin.tar.xz"
      sha256 "02d207d8b261f2280dc1291878af0435f05eb35b209f04dff563304516eb01d7"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/LucasPickering/env-select/releases/download/v1.1.0/env-select-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "55906bfa4ba0320a55f411495161fe02bef8529d9a139fda4c91359ac347bf02"
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
