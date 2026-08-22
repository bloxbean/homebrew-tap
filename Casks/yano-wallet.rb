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

  # Homebrew APPLIES com.apple.quarantine, on upgrades as well as
  # installs, and these builds are not signed or notarised — so macOS
  # refuses to run them until someone clears it. --no-quarantine works
  # but has to be repeated on every , and a bare
  #  takes no cask flags at all, so it silently comes back.
  #
  # Clearing it here instead: the whole staged folder, because the
  # bundled Yano node is a second executable that prompts separately.
  #
  # This does strip a security check without the user asking. It is a
  # deliberate trade for software the tap owner builds and publishes;
  # signing and notarising is what makes it unnecessary.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", staged_path],
                   must_succeed: false
  end

  caveats <<~EOS
    Start the wallet with:
      yano-wallet

    These builds are not signed or notarised yet, so the cask clears
    macOS's quarantine flag for you on install and upgrade. If macOS
    still refuses to run it:
      xattr -dr com.apple.quarantine "$(brew --prefix)/Caskroom/yano-wallet"

    The managed node downloads and validates the chain on first run,
    which takes hours and tens of GB under ~/.yano-wallet/.

    Uninstalling leaves ~/.yano-wallet/ in place: it holds your encrypted
    wallet vaults. Remove it by hand only if you have your recovery phrase.
  EOS
end
