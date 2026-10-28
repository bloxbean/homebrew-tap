class JulcPlayground < Formula
  desc "JuLC Playground - Web-based JRL editor and compiler"
  homepage "https://github.com/bloxbean/julc"
  version "0.1.0-pre20"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/bloxbean/julc/releases/download/v0.1.0-pre20/julc-playground-0.1.0-pre20-macos-aarch64.zip"
      sha256 "849433b2509a28e83f01aa84d95af23d6b136c3d56fbe54671b6e23e02f813a3"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/bloxbean/julc/releases/download/v0.1.0-pre20/julc-playground-0.1.0-pre20-linux-x86_64.zip"
      sha256 "18e35eb0475188d34ce8974bb39f4f79eb91961dcfa3d9e3c0db8e28c0de0378"
    elsif Hardware::CPU.arm?
      url "https://github.com/bloxbean/julc/releases/download/v0.1.0-pre20/julc-playground-0.1.0-pre20-linux-arm64.zip"
      sha256 "a5e43be7432cda24fd7a082639e22739edd3206d974416644324aee070a89421"
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
