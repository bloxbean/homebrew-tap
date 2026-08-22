cask "yano-wallet-jvm" do
  version "0.1.0-pre4"
  sha256 "d0dfa7942140b6ea42adbf096c61b0f8fc928b1088250a7ed4b7d96b8a6f2e7a"

  url "https://github.com/bloxbean/yano-wallet/releases/download/v#{version}/yano-wallet-macos_arm64_#{version}.dmg"
  name "Yano Wallet (JVM build)"
  desc "Full-node Cardano desktop wallet - JVM build with a bundled runtime"
  homepage "https://github.com/bloxbean/yano-wallet"

  # jpackage builds the .dmg on an Apple Silicon runner; there is no
  # Intel installer to point at yet.
  depends_on arch: :arm64

  # Bundles its own JRE, so no Java is required despite being the JVM build.
  app "Yano Wallet.app"

  caveats <<~EOS
    Installs to /Applications. This is the JVM build, bundling its own
    Java runtime - use it if the native build misbehaves.

    Uninstalling leaves ~/.yano-wallet/ in place: it holds your encrypted
    wallet vaults. Remove it by hand only if you have your recovery phrase.
  EOS
end
