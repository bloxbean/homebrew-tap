class JulcPlayground < Formula
  desc "JuLC Playground - Web-based JRL editor and compiler"
  homepage "https://github.com/bloxbean/julc"
  version "0.1.0-pre13"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/bloxbean/julc/releases/download/v0.1.0-pre13/julc-playground-0.1.0-pre13-macos-aarch64.zip"
      sha256 "16cee1d0b0d1581d16808a477b406058c1073e6ee11545b63ba5d60b744d2d01"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/bloxbean/julc/releases/download/v0.1.0-pre13/julc-playground-0.1.0-pre13-linux-x86_64.zip"
      sha256 "23f26926d007d70335fa739c28f122945aaf9bca5c48a10b31874a6d5f238a8a"
    elsif Hardware::CPU.arm?
      url "https://github.com/bloxbean/julc/releases/download/v0.1.0-pre13/julc-playground-0.1.0-pre13-linux-arm64.zip"
      sha256 "3e76b23dee8f97075d5e1719aeef4d1165e9d8bc79c36148c3e033c6123c8ddd"
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
