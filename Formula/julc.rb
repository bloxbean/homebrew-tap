class Julc < Formula
  desc "JuLC Cardano smart contract toolkit"
  homepage "https://github.com/bloxbean/julc"
  version "0.1.0-pre21"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/bloxbean/julc/releases/download/v0.1.0-pre21/julc-0.1.0-pre21-macos-aarch64.zip"
      sha256 "943999a0431be51b065a64bb7a48f083b1aef6e8a71aa8d6e1ac1a6d8d84d7f1"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/bloxbean/julc/releases/download/v0.1.0-pre21/julc-0.1.0-pre21-linux-x86_64.zip"
      sha256 "46600962015630928c61846b95afeaf006782e13c0de4cd218a0d287f5ed6bd8"
    elsif Hardware::CPU.arm?
      url "https://github.com/bloxbean/julc/releases/download/v0.1.0-pre21/julc-0.1.0-pre21-linux-arm64.zip"
      sha256 "df572c507857c2b7cda95eae20046888c768e4e43c90580a6569b4ed5eb1b43b"
    end
  end

  def install
    bin.install "julc"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/julc --version")
  end
end
