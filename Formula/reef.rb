# Rendered by scripts/update-tap.sh from reef-vcs/reef's
# packaging/homebrew/reef.rb.tmpl (R1.28); edit the template, not the tap.
class Reef < Formula
  desc "Version control for fleets of coding agents"
  homepage "https://github.com/reef-vcs/reef"
  version "0.3.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/reef-vcs/reef/releases/download/v0.3.0/reef-0.3.0-aarch64-apple-darwin.tar.gz"
      sha256 "a927c893b98bfdb677ec4012e2946f8dff3525d6103f041afbcc35ff4112361d"
    end
    on_intel do
      url "https://github.com/reef-vcs/reef/releases/download/v0.3.0/reef-0.3.0-x86_64-apple-darwin.tar.gz"
      sha256 "72b8af1f5202363dcd902d2be8740b486698f415e73665873ce8a5f76e187b6c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/reef-vcs/reef/releases/download/v0.3.0/reef-0.3.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "f064ed2d3cf5a9849f5e53f1e9c1fceba73691d43dd65d6f48a664e4a1546b9a"
    end
    on_intel do
      url "https://github.com/reef-vcs/reef/releases/download/v0.3.0/reef-0.3.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "cfc5ca5bcad03f027ca1ab7f2f46d7aa1bc2dcec82b72a541cba10e5ba974783"
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
