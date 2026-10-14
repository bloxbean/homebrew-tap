class YaciDevkit < Formula
  desc "Local Cardano devnet with Yaci Store, Yano, Ogmios and Kupo"
  homepage "https://devkit.yaci.xyz/"
  version "0.12.0"
  license "MIT"

  on_macos do
    # Built on macOS 15: the binary needs macOS 15 or later
    depends_on macos: :sequoia
    if Hardware::CPU.arm?
      url "https://github.com/bloxbean/yaci-devkit/releases/download/v0.12.0/yaci-cli-0.12.0-macos-ARM64.zip"
      sha256 "2b26260c01d4744802e7d4bb29ec9eaf344cd1342344412cd47e74c1139a350b"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/bloxbean/yaci-devkit/releases/download/v0.12.0/yaci-cli-0.12.0-linux-X64.zip"
      sha256 "10d1b2edea4cfef11188c0a4ab7033ff0bc743bb031d7cb28667c9e857e57eee"
    end
  end

  # Not conflicts_with: it makes Homebrew load the other formula, which Homebrew refuses for a tap formula the
  # user has not installed by name ("untrusted tap"), so the install would fail. Linking already stops both
  # formulas from installing the command at once.
  def caveats
    <<~EOS
      This installs the `yaci-devkit` command, as yaci-devkit-beta does: install only one of them.
      Devnets, downloaded components and ~/.yaci-cli/devkit.properties are shared between them.
    EOS
  end

  def install
    libexec.install "yaci-cli", "config"
    cfg = libexec/"config"
    # yaci-cli reads its config relative to the working directory, so point it at the installed config.
    # User overrides in ~/.yaci-cli/devkit.properties are imported last, so they win over the bundled config.
    # yaci.cli.bundled-config-dir is only the default for yaci.cli.plutus-costmodels-path (see application.properties),
    # so devkit.properties and environment variables can still override that path.
    (bin/"yaci-devkit").write <<~EOS
      #!/bin/bash
      exec "#{libexec}/yaci-cli" \\
        "-Dspring.config.import=optional:file:#{cfg}/application.properties,optional:file:#{cfg}/download.properties,optional:file:#{cfg}/node.properties,optional:file:${HOME}/.yaci-cli/devkit.properties" \\
        "-Dyaci.cli.bundled-config-dir=#{cfg}" "$@"
    EOS
  end

  test do
    assert_predicate libexec/"yaci-cli", :executable?
    assert_predicate libexec/"config/application.properties", :exist?
  end
end
