# Rendered by scripts/update-tap.sh from reef-vcs/reef's
# packaging/homebrew/reef.rb.tmpl (R1.28); edit the template, not the tap.
class Reef < Formula
  desc "Version control for fleets of coding agents"
  homepage "https://github.com/reef-vcs/reef"
  version "0.4.1"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/reef-vcs/reef/releases/download/v0.4.1/reef-0.4.1-aarch64-apple-darwin.tar.gz"
      sha256 "bb3606c8ddea42584b7a3dbf96c4cee2887141ad82ca511e9a3d6f3a8906d6c8"
    end
    on_intel do
      url "https://github.com/reef-vcs/reef/releases/download/v0.4.1/reef-0.4.1-x86_64-apple-darwin.tar.gz"
      sha256 "1620af591c6f35f41a287e395e6854abf9761adc3963d7106d2256c8d43b17bc"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/reef-vcs/reef/releases/download/v0.4.1/reef-0.4.1-aarch64-unknown-linux-musl.tar.gz"
      sha256 "9d2e60989d50888d6fe3c7922106a929f5f19b098938bf0189d17fe1958e109b"
    end
    on_intel do
      url "https://github.com/reef-vcs/reef/releases/download/v0.4.1/reef-0.4.1-x86_64-unknown-linux-musl.tar.gz"
      sha256 "6e4fc342cac8a7b18665492817ca583020eba2589a6d052faecb463e8ea8d7eb"
    end
  end

  def install
    bin.install "reef", "reef-daemon"
    bash_completion.install "completions/reef.bash" => "reef"
    zsh_completion.install "completions/_reef"
    fish_completion.install "completions/reef.fish"
  end

  test do
    assert_match "reef #{version} (", shell_output("#{bin}/reef --version")
  end
end
