class Julc < Formula
  desc "JuLC Cardano smart contract toolkit"
  homepage "https://github.com/bloxbean/julc"
  version "0.1.0-pre22"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/bloxbean/julc/releases/download/v0.1.0-pre22/julc-0.1.0-pre22-macos-aarch64.zip"
      sha256 "7250e2194d4dc0e32c73d1336eef633f586d0b3580421866e2888878a5742bf5"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/bloxbean/julc/releases/download/v0.1.0-pre22/julc-0.1.0-pre22-linux-x86_64.zip"
      sha256 "b3fd829850b4417228ad54296aaeb411fa829718389f85090d856b4ac8ce2630"
    elsif Hardware::CPU.arm?
      url "https://github.com/bloxbean/julc/releases/download/v0.1.0-pre22/julc-0.1.0-pre22-linux-arm64.zip"
      sha256 "9821153884a3e0cea684d4a2ec83f19e4c1660b16daa93f2fceab20e266736bb"
    end
  end

  def install
    bin.install "julc"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/julc --version")
  end
end
