class Roundtable < Formula
  desc "Multi-agent coordination hub for AI CLI agents"
  homepage "https://github.com/bloxbean/roundtable"
  version "0.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/bloxbean/roundtable/releases/download/v#{version}/roundtable-#{version}-macos-aarch64.zip"
      sha256 "PLACEHOLDER"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/bloxbean/roundtable/releases/download/v#{version}/roundtable-#{version}-linux-x86_64.zip"
      sha256 "PLACEHOLDER"
    end
  end

  def install
    bin.install "roundtable-#{version}/roundtable"
  end

  test do
    assert_match "Started RoundtableApplication", shell_output("#{bin}/roundtable &; sleep 3; kill $!; wait 2>/dev/null; true")
  end
end
