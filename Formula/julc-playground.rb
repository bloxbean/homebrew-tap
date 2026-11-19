class JulcPlayground < Formula
  desc "JuLC Playground - Web-based JuLC editor and compiler"
  homepage "https://github.com/bloxbean/julc"
  version "0.1.0-pre22"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/bloxbean/julc/releases/download/v0.1.0-pre22/julc-playground-0.1.0-pre22-macos-aarch64.zip"
      sha256 "393970c4987eec2b7ba71a213bafa19b68efb33fc3ca0e40c1bf95cacfb78565"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/bloxbean/julc/releases/download/v0.1.0-pre22/julc-playground-0.1.0-pre22-linux-x86_64.zip"
      sha256 "8cdbdf243211129b894f0b9f61e098bd85e93bc43020d91ed405a59989a0f05f"
    elsif Hardware::CPU.arm?
      url "https://github.com/bloxbean/julc/releases/download/v0.1.0-pre22/julc-playground-0.1.0-pre22-linux-arm64.zip"
      sha256 "c7dd898aeb7af32d126a965a380825114e55ab04344e65f5a38ea11bb2207967"
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
