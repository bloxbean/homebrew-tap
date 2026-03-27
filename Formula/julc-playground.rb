class JulcPlayground < Formula
  desc "JuLC Playground - Web-based JRL editor and compiler"
  homepage "https://github.com/bloxbean/julc"
  version "0.1.0-pre9"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/bloxbean/julc/releases/download/v0.1.0-pre9/julc-playground-0.1.0-pre9-macos-aarch64.zip"
      sha256 "813fd0213265b2eab96e3aba3090c2f11a6a044bef79476b8fc1d9bb18711e8e"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/bloxbean/julc/releases/download/v0.1.0-pre9/julc-playground-0.1.0-pre9-linux-x86_64.zip"
      sha256 "970340a7b8b202d51179c7175d954983a1c9d89608f68fd484907600098e6c74"
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
