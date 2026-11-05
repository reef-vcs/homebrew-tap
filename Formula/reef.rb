# Rendered by scripts/update-tap.sh from reef-vcs/reef's
# packaging/homebrew/reef.rb.tmpl (R1.28); edit the template, not the tap.
class Reef < Formula
  desc "Version control for fleets of coding agents"
  homepage "https://github.com/reef-vcs/reef"
  version "0.4.2"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/reef-vcs/reef/releases/download/v0.4.2/reef-0.4.2-aarch64-apple-darwin.tar.gz"
      sha256 "0702afdbebca97a3a935fecb75e744f48fd9ca1bcdd1e6ca4496f48b916dd718"
    end
    on_intel do
      url "https://github.com/reef-vcs/reef/releases/download/v0.4.2/reef-0.4.2-x86_64-apple-darwin.tar.gz"
      sha256 "2044f43084fdf9b540852a494af4523d0a397c013dc12c5d3be459d3640e59d0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/reef-vcs/reef/releases/download/v0.4.2/reef-0.4.2-aarch64-unknown-linux-musl.tar.gz"
      sha256 "cb48ca977e38724c61d1952e6dda1f5df86e7c11cba340454bdedbe9328a066b"
    end
    on_intel do
      url "https://github.com/reef-vcs/reef/releases/download/v0.4.2/reef-0.4.2-x86_64-unknown-linux-musl.tar.gz"
      sha256 "983bb4d2b0d07557a4df368bbfcaf9310528dff7f9a89173b2a5bd38092428b1"
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
