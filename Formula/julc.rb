class Julc < Formula
  desc "JuLC Cardano smart contract toolkit"
  homepage "https://github.com/bloxbean/julc"
  version "0.1.0-pre8"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/bloxbean/julc/releases/download/v0.1.0-pre8/julc-0.1.0-pre8-macos-aarch64.zip"
      sha256 "fab22db9a5eed639e1885ae3b58ea84783a673f5e56b3aa9fe15dc057f251bd1"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/bloxbean/julc/releases/download/v0.1.0-pre8/julc-0.1.0-pre8-linux-x86_64.zip"
      sha256 "c86aedbe8b7eeda0811cd8dbba05b5a34fde2b60dc3bf3c0b3885e6b8c4a4a70"
    end
  end

  def install
    bin.install "julc"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/julc --version")
  end
end
