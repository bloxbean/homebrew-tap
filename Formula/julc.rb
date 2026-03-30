class Julc < Formula
  desc "JuLC Cardano smart contract toolkit"
  homepage "https://github.com/bloxbean/julc"
  version "0.1.0-pre10"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/bloxbean/julc/releases/download/v0.1.0-pre10/julc-0.1.0-pre10-macos-aarch64.zip"
      sha256 "5395f22bade99c22a6bf8b43ce19f47651dd163b2539635589ab904be422a97c"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/bloxbean/julc/releases/download/v0.1.0-pre10/julc-0.1.0-pre10-linux-x86_64.zip"
      sha256 "4d09f7f22ef8201ef56c8d218acfc9f801724e102315f2de46ad94c2ff2a7b25"
    end
  end

  def install
    bin.install "julc"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/julc --version")
  end
end
