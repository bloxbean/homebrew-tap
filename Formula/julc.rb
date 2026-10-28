class Julc < Formula
  desc "JuLC Cardano smart contract toolkit"
  homepage "https://github.com/bloxbean/julc"
  version "0.1.0-pre20"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/bloxbean/julc/releases/download/v0.1.0-pre20/julc-0.1.0-pre20-macos-aarch64.zip"
      sha256 "374cd68596d67834a6ca69737c44e5464fdd622977c03fe7d6b0d7e996ddbe38"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/bloxbean/julc/releases/download/v0.1.0-pre20/julc-0.1.0-pre20-linux-x86_64.zip"
      sha256 "7727982605f0a1aa96cc300af7163d3307bf12f73f0e638a86792406f88ff4ef"
    elsif Hardware::CPU.arm?
      url "https://github.com/bloxbean/julc/releases/download/v0.1.0-pre20/julc-0.1.0-pre20-linux-arm64.zip"
      sha256 "e3897f681e7a658a03bdb4322b68cd3016def6d822ce5c8f913bdb04e5dd5e5d"
    end
  end

  def install
    bin.install "julc"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/julc --version")
  end
end
