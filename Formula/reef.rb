# Rendered by scripts/update-tap.sh from reef-vcs/reef's
# packaging/homebrew/reef.rb.tmpl (R1.28); edit the template, not the tap.
class Reef < Formula
  desc "Version control for fleets of coding agents"
  homepage "https://github.com/reef-vcs/reef"
  version "0.2.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/reef-vcs/reef/releases/download/v0.2.0/reef-0.2.0-aarch64-apple-darwin.tar.gz"
      sha256 "f73dc87dc1d6ac91b3292f1611847be4f3ffb7f19450bb9253deba0868a8003e"
    end
    on_intel do
      url "https://github.com/reef-vcs/reef/releases/download/v0.2.0/reef-0.2.0-x86_64-apple-darwin.tar.gz"
      sha256 "fa4d358cbc3225814237fd93d222a8df6ec80f76a8fb23f256a10818f345ee9e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/reef-vcs/reef/releases/download/v0.2.0/reef-0.2.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "6d39652b933bef79fe976b5e3f16700e7bdbb25fb7961bd5cb8ac8bb961c5f4e"
    end
    on_intel do
      url "https://github.com/reef-vcs/reef/releases/download/v0.2.0/reef-0.2.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "23b6fe172ce5ecbe35b3be12631a9aac5ddd170c03985bb6eb1a17361af91637"
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
