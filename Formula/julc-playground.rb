class JulcPlayground < Formula
  desc "JuLC Playground - Web-based JRL editor and compiler"
  homepage "https://github.com/bloxbean/julc"
  version "0.1.0-pre15"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/bloxbean/julc/releases/download/v0.1.0-pre15/julc-playground-0.1.0-pre15-macos-aarch64.zip"
      sha256 "1cd1a24e09a24efca912a79fe52a6eb906afa84b893dcd151008ebe81d43e50b"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/bloxbean/julc/releases/download/v0.1.0-pre15/julc-playground-0.1.0-pre15-linux-x86_64.zip"
      sha256 "d597e25cb942a7d2be0d62b449d2c8460139291387b51bc6b0e7ae838d49a4f7"
    elsif Hardware::CPU.arm?
      url "https://github.com/bloxbean/julc/releases/download/v0.1.0-pre15/julc-playground-0.1.0-pre15-linux-arm64.zip"
      sha256 "dfd12076359742f6f241ff7ece4ea6d8af795ec21ed97565e249ecb0683fb548"
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
