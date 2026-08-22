cask "yano-wallet" do
  version "0.1.0-pre4"
  sha256 "c63fb60a4cefe061f5c2a17034c3f0697bc11fa195153545faf0ee57b25ec703"

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

    The managed node downloads and validates the chain on first run,
    which takes hours and tens of GB under ~/.yano-wallet/.

    Uninstalling leaves ~/.yano-wallet/ in place: it holds your encrypted
    wallet vaults. Remove it by hand only if you have your recovery phrase.
  EOS
end
