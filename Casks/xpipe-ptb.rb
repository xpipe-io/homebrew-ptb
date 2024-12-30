cask "xpipe-ptb" do
  arch arm: "arm64", intel: "x86_64"
  version "14.0-33"
  desc "XPipe PTB (Public Test Build)"
  homepage "https://xpipe.io"
  url "https://github.com/xpipe-io/xpipe-ptb/releases/download/#{version}/xpipe-installer-macos-#{arch}.pkg",
      verified: "github.com"
  sha256 arm: "595aeeff28cd0e3dd8a92e677979a748cf299b1c01325ea01596ef8ea5fb310c", intel: "2ff8532acb8e35113e340bb588ad13f140726e6621a8459917968857765b2f58"
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
