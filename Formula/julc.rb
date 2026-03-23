class Julc < Formula
  desc "JuLC Cardano smart contract toolkit"
  homepage "https://github.com/bloxbean/julc"
  version "0.1.0-pre7"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/bloxbean/julc/releases/download/v0.1.0-pre7/julc-0.1.0-pre7-macos-aarch64.zip"
      sha256 "970ec820ec6318db7b9070f7a7f195738b8641e3cceea21f913c5ee9d173231e"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/bloxbean/julc/releases/download/v0.1.0-pre7/julc-0.1.0-pre7-linux-x86_64.zip"
      sha256 "e68f056a38e8fb752f655fc404083e2a186dca6f2444dc009f85d2f1aa05b7b5"
    end
  end

  def install
    bin.install "julc"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/julc --version")
  end
end
