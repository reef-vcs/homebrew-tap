# Rendered by scripts/update-tap.sh from reef-vcs/reef's
# packaging/homebrew/reef.rb.tmpl (R1.28); edit the template, not the tap.
class Reef < Formula
  desc "Version control for fleets of coding agents"
  homepage "https://github.com/reef-vcs/reef"
  version "0.4.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/reef-vcs/reef/releases/download/v0.4.0/reef-0.4.0-aarch64-apple-darwin.tar.gz"
      sha256 "d44dcb35d8339e42f753296ee3cc94f155ee68a59e54d94f9935f6250275ac7c"
    end
    on_intel do
      url "https://github.com/reef-vcs/reef/releases/download/v0.4.0/reef-0.4.0-x86_64-apple-darwin.tar.gz"
      sha256 "8bb1bf22bb089db5735882665dc753243213a1874b5d5fd5cd563a307e87b78b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/reef-vcs/reef/releases/download/v0.4.0/reef-0.4.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "f0c80c337803061665e6677bd517cea8f6ed30ec90881a3dbe492c496249b13f"
    end
    on_intel do
      url "https://github.com/reef-vcs/reef/releases/download/v0.4.0/reef-0.4.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "42c2af33d277cdb7a58218545de1bd33a9eb36c7fe08a061a476074e23d6f13e"
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
