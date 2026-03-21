class Julc < Formula
  desc "JuLC Cardano smart contract toolkit"
  homepage "https://github.com/bloxbean/julc"
  version "0.1.0-pre4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/bloxbean/julc/releases/download/v0.1.0-pre4/julc-0.1.0-pre4-macos-aarch64.zip"
      sha256 "7cca2e4b303950f0f56019e905f3712f8f45ccebe748bc37aa4ab2f178ff7031"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/bloxbean/julc/releases/download/v0.1.0-pre4/julc-0.1.0-pre4-linux-x86_64.zip"
      sha256 "6a2663057506c4208311ef1c40da920d239bace4b7f23211f0314a23cade1c35"
    end
  end

  def install
    bin.install "julc"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/julc --version")
  end
end
