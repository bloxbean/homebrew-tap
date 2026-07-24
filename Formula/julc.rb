class Julc < Formula
  desc "JuLC Cardano smart contract toolkit"
  homepage "https://github.com/bloxbean/julc"
  version "0.1.0-pre15"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/bloxbean/julc/releases/download/v0.1.0-pre15/julc-0.1.0-pre15-macos-aarch64.zip"
      sha256 "f1506410ab6091aaa99dc0c3ac0a3740b6b6b82b78741f56c3e42698efeb06df"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/bloxbean/julc/releases/download/v0.1.0-pre15/julc-0.1.0-pre15-linux-x86_64.zip"
      sha256 "37a6c5d6359fe03fbeb3c27a26c16d8a45e633f04cc09548a82ceaa4879b1e4c"
    elsif Hardware::CPU.arm?
      url "https://github.com/bloxbean/julc/releases/download/v0.1.0-pre15/julc-0.1.0-pre15-linux-arm64.zip"
      sha256 "4ee5f26a4fe2774e03163d7bd441c2bdfbf2d8834a18829d4d325bc0a606d40f"
    end
  end

  def install
    bin.install "julc"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/julc --version")
  end
end
