class JulcPlayground < Formula
  desc "JuLC Playground - Web-based JRL editor and compiler"
  homepage "https://github.com/bloxbean/julc"
  version "0.1.0-pre17"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/bloxbean/julc/releases/download/v0.1.0-pre17/julc-playground-0.1.0-pre17-macos-aarch64.zip"
      sha256 "08a2039839a2fd956fca3dc2b59d4767b997796cb6691bf6cb2a049f038c2906"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/bloxbean/julc/releases/download/v0.1.0-pre17/julc-playground-0.1.0-pre17-linux-x86_64.zip"
      sha256 "327176dd144c7d0c28471630eaa5d68f061418bed3b184347c731a6bfe6c1e1f"
    elsif Hardware::CPU.arm?
      url "https://github.com/bloxbean/julc/releases/download/v0.1.0-pre17/julc-playground-0.1.0-pre17-linux-arm64.zip"
      sha256 "bfae83f9468f6db0254f2bfb57c113bb2cfb7669f3264689e983d9521ee865e8"
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
