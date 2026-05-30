class Julc < Formula
  desc "JuLC Cardano smart contract toolkit"
  homepage "https://github.com/bloxbean/julc"
  version "0.1.0-pre13"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/bloxbean/julc/releases/download/v0.1.0-pre13/julc-0.1.0-pre13-macos-aarch64.zip"
      sha256 "d7190f3d7d35b17f5a42eab27354dce0bd4c3777b7202c3c85c91225012453ba"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/bloxbean/julc/releases/download/v0.1.0-pre13/julc-0.1.0-pre13-linux-x86_64.zip"
      sha256 "bbda0d75787b98d22ffdd4dfda0860154eb89992ee05dfa1dad6855e3717333b"
    elsif Hardware::CPU.arm?
      url "https://github.com/bloxbean/julc/releases/download/v0.1.0-pre13/julc-0.1.0-pre13-linux-arm64.zip"
      sha256 "dbb72b645e13e5faf1f46596152b4fe3d5f97aa4f4f8b66595b6b8d9ed6bea73"
    end
  end

  def install
    bin.install "julc"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/julc --version")
  end
end
