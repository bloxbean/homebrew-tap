class Julc < Formula
  desc "JuLC Cardano smart contract toolkit"
  homepage "https://github.com/bloxbean/julc"
  version "0.1.0-pre12"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/bloxbean/julc/releases/download/v0.1.0-pre12/julc-0.1.0-pre12-macos-aarch64.zip"
      sha256 "24ed1638cfcb59ba952e1628081ec7e7c19f7b05530708e4bf48cfb50b5c73a1"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/bloxbean/julc/releases/download/v0.1.0-pre12/julc-0.1.0-pre12-linux-x86_64.zip"
      sha256 "05007dd84c43ab29fd7c61f9582ab3d82f7e0fe90413b18daca0ef20afcafeff"
    end
  end

  def install
    bin.install "julc"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/julc --version")
  end
end
