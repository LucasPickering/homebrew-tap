class EnvSelect < Formula
  desc "Switch between common values for environment variables"
  homepage "https://github.com/LucasPickering/env-select"
  license "MIT"

  # Brew gets upset if you define the verison in the url and the `version` field,
  # but if we just put it in the URL we have to write it 6 times... so this
  # is our alternative
  verzun = "0.11.0"

  on_macos do
    on_arm do
      url "https://github.com/LucasPickering/env-select/releases/download/v#{verzun}/env-select-v#{verzun}-aarch64-apple-darwin.tar.gz"
      sha256 "d7290407ba4c95ccd16863f96a6f2e065bc4637242f53e01e4a93ad92d15b6a2"
    end
    on_intel do
      url "https://github.com/LucasPickering/env-select/releases/download/v#{verzun}/env-select-v#{verzun}-x86_64-apple-darwin.tar.gz"
      sha256 "9017564993ec7e3c2e7350c1b9d7f39bab8e944a9d2910cfeefc6cad6aabd0d4"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/LucasPickering/env-select/releases/download/v#{verzun}/env-select-v#{verzun}-x86_64-unknown-linux-musl.tar.gz"
      sha256 "84575a4601fbaf3c572fe3500ae72cbd2ff1ef379ab3ea0fab8c5eb3c676545a"
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
