class EnvSelect < Formula
  desc "Switch between common values for environment variables"
  homepage "https://github.com/LucasPickering/env-select"
  license "MIT"

  # Brew gets upset if you define the verison in the url and the `version` field,
  # but if we just put it in the URL we have to write it 6 times... so this
  # is our alternative
  verzun = "0.9.0"

  on_macos do
    on_arm do
      url "https://github.com/LucasPickering/env-select/releases/download/v#{verzun}/env-select-v#{verzun}-aarch64-apple-darwin.tar.gz"
      sha256 "8a9bb4bd43e85821295b81266c45fdd7413252adc93aea4482c7e36f941abe90"
    end
    on_intel do
      url "https://github.com/LucasPickering/env-select/releases/download/v#{verzun}/env-select-v#{verzun}-x86_64-apple-darwin.tar.gz"
      sha256 "fd448112b13891e0cf141e46b7607f1101d66d76bace06ee466dad6dacb7c6e9"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/LucasPickering/env-select/releases/download/v#{verzun}/env-select-v#{verzun}-x86_64-unknown-linux-musl.tar.gz"
      sha256 "30a03c2e49df19619ad8123dcf79f2dfefc6a64fc893f0d3cff603056ba58a28"
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
