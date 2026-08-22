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

  # See the note in yano-wallet.rb: Homebrew quarantines on upgrade as
  # well as install, and an unsigned app cannot be opened until it is
  # cleared. Targets the installed bundle, which carries the JRE and the
  # node jar with it.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/Yano Wallet.app"],
                   must_succeed: false
  end

  caveats <<~EOS
    Installs to /Applications. This is the JVM build, bundling its own
    Java runtime - use it if the native build misbehaves.

    These builds are not signed or notarised yet, so the cask clears
    macOS's quarantine flag for you on install and upgrade. If macOS
    still refuses to open it:
      xattr -dr com.apple.quarantine "/Applications/Yano Wallet.app"

    Uninstalling leaves ~/.yano-wallet/ in place: it holds your encrypted
    wallet vaults. Remove it by hand only if you have your recovery phrase.
  EOS
end
