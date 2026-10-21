class Julc < Formula
  desc "JuLC Cardano smart contract toolkit"
  homepage "https://github.com/bloxbean/julc"
  version "0.1.0-pre19"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/bloxbean/julc/releases/download/v0.1.0-pre19/julc-0.1.0-pre19-macos-aarch64.zip"
      sha256 "bb28cf4aa9b2032b79498a26574cf8f76cfad13f2137242aaabef5aba17f4570"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/bloxbean/julc/releases/download/v0.1.0-pre19/julc-0.1.0-pre19-linux-x86_64.zip"
      sha256 "88217edb57ec033d3c7e3943362391debbec0d6dd995021d4b97a39b657a0d2a"
    elsif Hardware::CPU.arm?
      url "https://github.com/bloxbean/julc/releases/download/v0.1.0-pre19/julc-0.1.0-pre19-linux-arm64.zip"
      sha256 "e939b8cf34f284f1d55df2bcb1a948a4bdba6e674f780c0b2c71f8e587b213bc"
    end
  end

  def install
    bin.install "julc"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/julc --version")
  end
end
