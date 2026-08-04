class JulcPlayground < Formula
  desc "JuLC Playground - Web-based JRL editor and compiler"
  homepage "https://github.com/bloxbean/julc"
  version "0.1.0-pre16"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/bloxbean/julc/releases/download/v0.1.0-pre16/julc-playground-0.1.0-pre16-macos-aarch64.zip"
      sha256 "f16d43c23a6979bc3fb7c4f1c36e25a18a0c00316446f235a4fc4ff6905bc7d4"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/bloxbean/julc/releases/download/v0.1.0-pre16/julc-playground-0.1.0-pre16-linux-x86_64.zip"
      sha256 "b12a127c76a7cc4212279520a1d8851a2a2e6a13488e7a86da9112391f2ac503"
    elsif Hardware::CPU.arm?
      url "https://github.com/bloxbean/julc/releases/download/v0.1.0-pre16/julc-playground-0.1.0-pre16-linux-arm64.zip"
      sha256 "4c71a3baf6e00ebf2af7f3a92a09e37197849d2eaafff649cac4bcda52216f22"
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
