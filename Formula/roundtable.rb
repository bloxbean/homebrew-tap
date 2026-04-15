class Roundtable < Formula
  desc "Multi-agent coordination hub for AI CLI agents"
  homepage "https://github.com/bloxbean/roundtable"
  version "0.1.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/bloxbean/roundtable/releases/download/v0.1.2/roundtable-0.1.2-macos-aarch64.zip"
      sha256 "7f64ce1dbb7db42e902832477e58a18703ee72258211a336748d51510b8c538e"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/bloxbean/roundtable/releases/download/v0.1.2/roundtable-0.1.2-linux-x86_64.zip"
      sha256 "7b0f83fb22595bed668e7ffd30b76ae7d701fc57037a1a32b878fab25b71f19b"
    end
  end

  def install
    bin.install "roundtable"
  end

  test do
    assert_match "Started RoundtableApplication", shell_output("#{bin}/roundtable &; sleep 3; kill $!; wait 2>/dev/null; true")
  end
end
