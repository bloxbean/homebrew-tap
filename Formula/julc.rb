class Julc < Formula
  desc "JuLC Cardano smart contract toolkit"
  homepage "https://github.com/bloxbean/julc"
  version "0.1.0-pre6"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/bloxbean/julc/releases/download/v0.1.0-pre6/julc-0.1.0-pre6-macos-aarch64.zip"
      sha256 "d29e909e51e16ac33a32c2f1127cc10be816ebccc0d290123176e95236ef59e4"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/bloxbean/julc/releases/download/v0.1.0-pre6/julc-0.1.0-pre6-linux-x86_64.zip"
      sha256 "747ec2d5ce7cb4e97a85a37deb2df1e4a2ac5f51d8e618e04990ffc0ab8a370f"
    end
  end

  def install
    bin.install "julc"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/julc --version")
  end
end
