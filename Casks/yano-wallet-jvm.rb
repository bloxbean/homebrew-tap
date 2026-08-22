cask "yano-wallet-jvm" do
  version "0.1.0-pre5"
  sha256 "015b243f24e4cf35079c2b72a8b348a2ce4ba306fc9a4e8c944464e96047cb1c"

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

    Installed WITHOUT --no-quarantine? macOS will refuse to open it
    ("Apple could not verify..."). Clear it once, no re-download:
      xattr -dr com.apple.quarantine "/Applications/Yano Wallet.app"

    Point it at the WHOLE bundle: the Yano node inside it is a second
    executable and prompts separately. -r covers both.

    Uninstalling leaves ~/.yano-wallet/ in place: it holds your encrypted
    wallet vaults. Remove it by hand only if you have your recovery phrase.
  EOS
end
