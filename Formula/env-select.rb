class EnvSelect < Formula
  desc "Switch between common values for environment variables"
  homepage "https://github.com/LucasPickering/env-select"
  license "MIT"

  # Brew gets upset if you define the verison in the url and the `version` field,
  # but if we just put it in the URL we have to write it 6 times... so this
  # is our alternative
  verzun = "0.6.2"

  on_macos do
    on_arm do
      url "https://github.com/LucasPickering/env-select/releases/download/v#{verzun}/env-select-v#{verzun}-aarch64-apple-darwin.tar.gz"
      sha256 "4678b90a115ab4a1860b0689a97be46fe34077a0365b9eb3ac9e65ffeea2a52d"
    end
    on_intel do
      url "https://github.com/LucasPickering/env-select/releases/download/v#{verzun}/env-select-v#{verzun}-x86_64-apple-darwin.tar.gz"
      sha256 "e1a43c41434dc460f444806eb6a9d7006d450718934da6c59b9dce36f840a563"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/LucasPickering/env-select/releases/download/v#{verzun}/env-select-v#{verzun}-x86_64-unknown-linux-musl.tar.gz"
      sha256 "538b0549b1fffca84b2762b791fe4d0b9e37e8bb6803c43e6a61ae7a44039b70"
    end
  end

  def install
    bin.install "env-select"

    system "#{bin}/env-select --shell fish init > es.fish"
    fish_function.install "es.fish"
    system "#{bin}/env-select --shell zsh init > es.zsh"
    zsh_function.install "es.zsh"
  end

  test do
    system "#{bin}/env-select", "set", "TEST_VARIABLE", "true"
  end
end
