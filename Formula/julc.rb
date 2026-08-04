class Julc < Formula
  desc "JuLC Cardano smart contract toolkit"
  homepage "https://github.com/bloxbean/julc"
  version "0.1.0-pre16"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/bloxbean/julc/releases/download/v0.1.0-pre16/julc-0.1.0-pre16-macos-aarch64.zip"
      sha256 "dbb4eff971e5c5d68359862cddc405e5f0c6f9a32dbe8440b0f9bf7835feaa42"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/bloxbean/julc/releases/download/v0.1.0-pre16/julc-0.1.0-pre16-linux-x86_64.zip"
      sha256 "53a1a4932bda8c61342b05e607b2fb39b1181c1fb9533319ffcfe984e4c9e4cf"
    elsif Hardware::CPU.arm?
      url "https://github.com/bloxbean/julc/releases/download/v0.1.0-pre16/julc-0.1.0-pre16-linux-arm64.zip"
      sha256 "367840e6cdba2d768ed712438b8d2a080e0ab45c4da8765a8f4e5b23a35bdf50"
    end
  end

  def install
    bin.install "julc"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/julc --version")
  end
end
