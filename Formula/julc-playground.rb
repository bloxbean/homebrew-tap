class JulcPlayground < Formula
  desc "JuLC Playground - Web-based JRL editor and compiler"
  homepage "https://github.com/bloxbean/julc"
  version "0.1.0-pre14"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/bloxbean/julc/releases/download/v0.1.0-pre14/julc-playground-0.1.0-pre14-macos-aarch64.zip"
      sha256 "4c91449f902c0314b26da893b8f3b6d248ed556b4e10d19e90bcb02cdc8630db"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/bloxbean/julc/releases/download/v0.1.0-pre14/julc-playground-0.1.0-pre14-linux-x86_64.zip"
      sha256 "c6ad3ebe63c676443cfe1f99ac29cb9a5ed1b8adc80ff41580a93cc443165a86"
    elsif Hardware::CPU.arm?
      url "https://github.com/bloxbean/julc/releases/download/v0.1.0-pre14/julc-playground-0.1.0-pre14-linux-arm64.zip"
      sha256 "557a6b569b7a36aadae4c0f013df08e37abaa26caae4e43707542d5208784581"
    end
  end

  def install
    bin.install "julc-playground"
  end

  test do
    # Start server in background, check health endpoint, then stop
    port = free_port
    pid = fork do
      ENV["JRL_PLAYGROUND_PORT"] = port.to_s
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
