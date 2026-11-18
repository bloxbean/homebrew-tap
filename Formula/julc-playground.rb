class JulcPlayground < Formula
  desc "JuLC Playground - Web-based JuLC editor and compiler"
  homepage "https://github.com/bloxbean/julc"
  version "0.1.0-pre21"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/bloxbean/julc/releases/download/v0.1.0-pre21/julc-playground-0.1.0-pre21-macos-aarch64.zip"
      sha256 "0539df0a7923dfa8768a0145bc228401409c7825325aba180d64a77a2a68e60e"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/bloxbean/julc/releases/download/v0.1.0-pre21/julc-playground-0.1.0-pre21-linux-x86_64.zip"
      sha256 "fb304ecdd6740fbaf0e2a4c9a920354b976bd4e903098c0e157fa4c2c7462edc"
    elsif Hardware::CPU.arm?
      url "https://github.com/bloxbean/julc/releases/download/v0.1.0-pre21/julc-playground-0.1.0-pre21-linux-arm64.zip"
      sha256 "5e8114fb64f589b5f91454b6d75d092d0ac1f9d886ffd260d2425870b1925a05"
    end
  end

  def install
    bin.install "julc-playground"
  end

  test do
    # Start server in background, check health endpoint, then stop
    port = free_port
    pid = fork do
      ENV["JULC_PLAYGROUND_PORT"] = port.to_s
      exec bin/"julc-playground"
    end
    sleep 3
    begin
      output = shell_output("curl -s http://localhost:#{port}/api/health")
      assert_match "ok", output.downcase
    ensure
      Process.kill("TERM", pid)
      Process.wait(pid)
    end
  end
end
