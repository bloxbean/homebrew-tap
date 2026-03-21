class Julc < Formula
  desc "JuLC Cardano smart contract toolkit"
  homepage "https://github.com/bloxbean/julc"
  version "0.1.0-pre5"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/bloxbean/julc/releases/download/v0.1.0-pre5/julc-0.1.0-pre5-macos-aarch64.zip"
      sha256 "41f8bb99a9e89da4340df37b490ac444a44646135bfd016e7bb74179fe9fbae7"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/bloxbean/julc/releases/download/v0.1.0-pre5/julc-0.1.0-pre5-linux-x86_64.zip"
      sha256 "9a0b38496cca40cb3a97209a667ccc221bf548ea09a2ed4e831300dc7450ff70"
    end
  end

  def install
    bin.install "julc"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/julc --version")
  end
end
