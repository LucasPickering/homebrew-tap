class EnvSelect < Formula
  desc "Switch between common values for environment variables"
  homepage "https://github.com/LucasPickering/env-select"
  license "MIT"

  # Brew gets upset if you define the verison in the url and the `version` field,
  # but if we just put it in the URL we have to write it 6 times... so this
  # is our alternative
  verzun = "0.10.0"

  on_macos do
    on_arm do
      url "https://github.com/LucasPickering/env-select/releases/download/v#{verzun}/env-select-v#{verzun}-aarch64-apple-darwin.tar.gz"
      sha256 "a53c3a5edbe369d2f661772b8bba58cfa023c3f73abeaf427727f4bb416f085e"
    end
    on_intel do
      url "https://github.com/LucasPickering/env-select/releases/download/v#{verzun}/env-select-v#{verzun}-x86_64-apple-darwin.tar.gz"
      sha256 "224470da9052923619c82be40d20b7e6cb25e8fb5661563f14e0c67dcc508366"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/LucasPickering/env-select/releases/download/v#{verzun}/env-select-v#{verzun}-x86_64-unknown-linux-musl.tar.gz"
      sha256 "a9397f5cfdf24b433c88512343f176efe8977db22ab3af715948be42cf17efea"
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
