cask "xpipe-ptb" do
  arch arm: "arm64", intel: "x86_64"
  version "15.4-8"
  desc "XPipe PTB (Public Test Build)"
  homepage "https://xpipe.io"
  url "https://github.com/xpipe-io/xpipe-ptb/releases/download/#{version}/xpipe-installer-macos-#{arch}.pkg",
      verified: "github.com"
  sha256 arm: "00c4fdc4e527cd8370b016f9ff7ba3c2cf2374ba39e04fc1a0f9a7776a3ffb1d", intel: "80119e17612cc7fb1c4d8150878728b0ed7e5e54cf975d4bd69ebf1dc5f42993"
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
