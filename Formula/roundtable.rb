class Roundtable < Formula
  desc "Multi-agent coordination hub for AI CLI agents"
  homepage "https://github.com/bloxbean/roundtable"
  version "0.1.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/bloxbean/roundtable/releases/download/v0.1.1/roundtable-0.1.1-macos-aarch64.zip"
      sha256 "5af89660d797d77e2de9fefbb360ed24e5bea97d494c2095f4e3b5b24e24c97b"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/bloxbean/roundtable/releases/download/v0.1.1/roundtable-0.1.1-linux-x86_64.zip"
      sha256 "2fbc40932eb008bb439103de00943334bc09a1dab702a9fc51c9e5cdfac89383"
    end
  end

  def install
    bin.install "roundtable-0.1.1/roundtable"
  end

  test do
    assert_match "Started RoundtableApplication", shell_output("#{bin}/roundtable &; sleep 3; kill $!; wait 2>/dev/null; true")
  end
end
