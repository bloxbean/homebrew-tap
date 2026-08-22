cask "yano-wallet" do
  version "0.1.0-pre5"
  sha256 "3060aa233c44c27b6dd925a1e7da5ef926972293d131b31c3884f2e4bc1c7cae"

  url "https://github.com/bloxbean/yano-wallet/releases/download/v#{version}/yano-wallet-native-macos_arm64_#{version}.zip"
  name "Yano Wallet"
  desc "Full-node Cardano desktop wallet with a managed Yano node"
  homepage "https://github.com/bloxbean/yano-wallet"

  # The native build is compiled for Apple Silicon only; Intel Macs
  # should install yano-wallet-jvm instead.
  depends_on arch: :arm64

  # run.sh resolves symlinks before locating yano-node/ beside itself,
  # so linking it into the PATH works.
  binary "yano-wallet-native-#{version}/run.sh", target: "yano-wallet"

  caveats <<~EOS
    Start the wallet with:
      yano-wallet

    Installed WITHOUT --no-quarantine? macOS will refuse to run it
    ("Apple could not verify..."). Clear it once, no re-download:
      xattr -dr com.apple.quarantine "$(brew --prefix)/Caskroom/yano-wallet"

    Point it at the FOLDER, not the binary: the bundled Yano node is a
    second executable and prompts separately. -r covers both.

    The managed node downloads and validates the chain on first run,
    which takes hours and tens of GB under ~/.yano-wallet/.

    Uninstalling leaves ~/.yano-wallet/ in place: it holds your encrypted
    wallet vaults. Remove it by hand only if you have your recovery phrase.
  EOS
end
