# Rendered by scripts/update-tap.sh from reef-vcs/reef's
# packaging/homebrew/reef.rb.tmpl (R1.28); edit the template, not the tap.
class Reef < Formula
  desc "Version control for fleets of coding agents"
  homepage "https://github.com/reef-vcs/reef"
  version "0.1.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/reef-vcs/reef/releases/download/v0.1.0/reef-0.1.0-aarch64-apple-darwin.tar.gz"
      sha256 "5e05da5a4a812c12cb217c5c091f64e41fb99a65918a14be098d001bd095a59f"
    end
    on_intel do
      url "https://github.com/reef-vcs/reef/releases/download/v0.1.0/reef-0.1.0-x86_64-apple-darwin.tar.gz"
      sha256 "913d9aa8b64737abfa129198b97c8fdd72626e2204b6d3f7c942f76d136fb49a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/reef-vcs/reef/releases/download/v0.1.0/reef-0.1.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "cf8d949eebcd6afbe01c08673bfc33d2bebf6a8d31122efde5d24ad9e8169360"
    end
    on_intel do
      url "https://github.com/reef-vcs/reef/releases/download/v0.1.0/reef-0.1.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "88160271698c9729819858ea418b896eeb25708da5067ac7ac8ec19d303df4bb"
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
