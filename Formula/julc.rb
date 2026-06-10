class Julc < Formula
  desc "JuLC Cardano smart contract toolkit"
  homepage "https://github.com/bloxbean/julc"
  version "0.1.0-pre14"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/bloxbean/julc/releases/download/v0.1.0-pre14/julc-0.1.0-pre14-macos-aarch64.zip"
      sha256 "8d7453cd7c51bd15af9a7d5f991c1114c43862a3f02f260e9b19e26080cb06ca"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/bloxbean/julc/releases/download/v0.1.0-pre14/julc-0.1.0-pre14-linux-x86_64.zip"
      sha256 "6bfadf49bf995160b245884927413ca4b18e4e13044fd73c514aebf27b8606e3"
    elsif Hardware::CPU.arm?
      url "https://github.com/bloxbean/julc/releases/download/v0.1.0-pre14/julc-0.1.0-pre14-linux-arm64.zip"
      sha256 "964c8df300f5bb942a12faa37c43ecb349d7024ab8627fa0088c4f5886306ba7"
    end
  end

  def install
    bin.install "julc"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/julc --version")
  end
end
