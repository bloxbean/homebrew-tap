class Julc < Formula
  desc "JuLC Cardano smart contract toolkit"
  homepage "https://github.com/bloxbean/julc"
  version "0.1.0-pre18"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/bloxbean/julc/releases/download/v0.1.0-pre18/julc-0.1.0-pre18-macos-aarch64.zip"
      sha256 "582d144afcd0aa53480489fe4e5a1672a37ff0e3b993e637f88f9c585af7d41d"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/bloxbean/julc/releases/download/v0.1.0-pre18/julc-0.1.0-pre18-linux-x86_64.zip"
      sha256 "793249ca53cccffe63af2d2302fde2a51a7f03add31ca6ce23293b0f4acb0fcc"
    elsif Hardware::CPU.arm?
      url "https://github.com/bloxbean/julc/releases/download/v0.1.0-pre18/julc-0.1.0-pre18-linux-arm64.zip"
      sha256 "616e80d1c65f82dec7a2c37bcd9178cf4fbfbbed3b0722b323eccbe4d6d5dea2"
    end
  end

  def install
    bin.install "julc"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/julc --version")
  end
end
