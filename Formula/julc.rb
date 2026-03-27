class Julc < Formula
  desc "JuLC Cardano smart contract toolkit"
  homepage "https://github.com/bloxbean/julc"
  version "0.1.0-pre9"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/bloxbean/julc/releases/download/v0.1.0-pre9/julc-0.1.0-pre9-macos-aarch64.zip"
      sha256 "9e630b50f9fa6946df1b753a5a99e477fa8267f9cf823c162430edfd2bcb9386"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/bloxbean/julc/releases/download/v0.1.0-pre9/julc-0.1.0-pre9-linux-x86_64.zip"
      sha256 "e1333af6a07e1d286e679a5ba5795786a4f17dfb62d5625d0a4f130e166dd5c5"
    end
  end

  def install
    bin.install "julc"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/julc --version")
  end
end
