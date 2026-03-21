 class Julc < Formula
   desc "JuLC Cardano smart contract toolkit"
   homepage "https://github.com/bloxbean/julc"
   version "0.1.0-pre4"
   license "MIT"

   on_macos do
     if Hardware::CPU.arm?
       url "https://github.com/bloxbean/julc/releases/download/v#{version}/julc-#{version}-macos-aarch64.zip"
       sha256 "PLACEHOLDER"
     end
   end

   on_linux do
     if Hardware::CPU.intel?
       url "https://github.com/bloxbean/julc/releases/download/v#{version}/julc-#{version}-linux-x86_64.zip"
       sha256 "PLACEHOLDER"
     end
   end

   def install
     bin.install "julc"
   end

   test do
     assert_match version.to_s, shell_output("#{bin}/julc --version")
   end
 end
