cask "xpipe-ptb" do
  arch arm: "arm64", intel: "x86_64"
  version "16.0-16"
  desc "XPipe PTB (Public Test Build)"
  homepage "https://xpipe.io"
  url "https://github.com/xpipe-io/xpipe-ptb/releases/download/#{version}/xpipe-installer-macos-#{arch}.pkg",
      verified: "github.com"
  sha256 arm: "ccbbc26fe982cc48bd47c6fd34dc6760a3caf0adc5f8a58cc5e30fc9af4d8ae7", intel: "63ecba6f4c609c0facdde0b8374cb2b4efb2c4154513b2300d864f1c77481fae"
  name "XPipe PTB"
  auto_updates true

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on formula: "util-linux"

  pkg "xpipe-installer-macos-#{arch}.pkg"
  uninstall script:  {
        executable: "/Applications/XPipe PTB.app/Contents/Resources/scripts/uninstall.sh",
        args:       [],
        sudo:       true,
      },
      pkgutil: "io.xpipe.xpipe-ptb"
  zap trash: [
    "~/.xpipe-ptb"
  ]
end
