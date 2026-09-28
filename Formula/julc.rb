class Julc < Formula
  desc "JuLC Cardano smart contract toolkit"
  homepage "https://github.com/bloxbean/julc"
  version "0.1.0-pre17"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/bloxbean/julc/releases/download/v0.1.0-pre17/julc-0.1.0-pre17-macos-aarch64.zip"
      sha256 "e1427ce7a21a4448ab53da49281aa65275c3655ca3713291ff9f21c5b950d128"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/bloxbean/julc/releases/download/v0.1.0-pre17/julc-0.1.0-pre17-linux-x86_64.zip"
      sha256 "11ae378b794e658d9ad1ae21e6d8508054063167cc3b51b96d9d4ee808be5c7b"
    elsif Hardware::CPU.arm?
      url "https://github.com/bloxbean/julc/releases/download/v0.1.0-pre17/julc-0.1.0-pre17-linux-arm64.zip"
      sha256 "24169ab83e4cce1cbd959e031db2372dad9d498ec3177dcae93bce09cd990574"
    end
  end

  def install
    bin.install "julc"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/julc --version")
  end
end
