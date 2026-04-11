class Julc < Formula
  desc "JuLC Cardano smart contract toolkit"
  homepage "https://github.com/bloxbean/julc"
  version "0.1.0-pre11"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/bloxbean/julc/releases/download/v0.1.0-pre11/julc-0.1.0-pre11-macos-aarch64.zip"
      sha256 "c221715bf58f04ee35ccdb56554d898dde9d16e34c070f96f3d77f8c81103021"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/bloxbean/julc/releases/download/v0.1.0-pre11/julc-0.1.0-pre11-linux-x86_64.zip"
      sha256 "d4614e5bd3fe6a202bd840745a5792f07079f64fcc442f9408813eeef78495a5"
    end
  end

  def install
    bin.install "julc"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/julc --version")
  end
end
