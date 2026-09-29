class JulcPlayground < Formula
  desc "JuLC Playground - Web-based JRL editor and compiler"
  homepage "https://github.com/bloxbean/julc"
  version "0.1.0-pre18"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/bloxbean/julc/releases/download/v0.1.0-pre18/julc-playground-0.1.0-pre18-macos-aarch64.zip"
      sha256 "7bbe10ef45735f5ca716bcf8d2b1f2ba42a2a48914259b58f74b948b2df7a061"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/bloxbean/julc/releases/download/v0.1.0-pre18/julc-playground-0.1.0-pre18-linux-x86_64.zip"
      sha256 "6d6c251a6df2ef789ad6794108c0e33dbc68df019742004980fb56f7a73bf518"
    elsif Hardware::CPU.arm?
      url "https://github.com/bloxbean/julc/releases/download/v0.1.0-pre18/julc-playground-0.1.0-pre18-linux-arm64.zip"
      sha256 "2d952dc0fe0c12f4d18dda6ee8832b821b136b367f8a5d03c6d3ca31bc4db0b7"
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
