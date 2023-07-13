class EnvSelect < Formula
  desc "Switch between common values for environment variables"
  homepage "https://github.com/LucasPickering/env-select"
  license "MIT"

  # Brew gets upset if you define the verison in the url and the `version` field,
  # but if we just put it in the URL we have to write it 6 times... so this
  # is our alternative
  verzun = "0.7.0"

  on_macos do
    on_arm do
      url "https://github.com/LucasPickering/env-select/releases/download/v#{verzun}/env-select-v#{verzun}-aarch64-apple-darwin.tar.gz"
      sha256 "d87d9eeaa7f5a9b357e5e566c5fb5f125f001a07b8e4936af816691f6ee216c5"
    end
    on_intel do
      url "https://github.com/LucasPickering/env-select/releases/download/v#{verzun}/env-select-v#{verzun}-x86_64-apple-darwin.tar.gz"
      sha256 "22d22b13f436390ccf3160a4ef7832976900ecff03916ffa92c8fe86f98b58e1"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/LucasPickering/env-select/releases/download/v#{verzun}/env-select-v#{verzun}-x86_64-unknown-linux-musl.tar.gz"
      sha256 "6c100ebc70d61e9c891fd2fc194e25b96c8fb2718772ab3ea90309668da4cfad"
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
