cask "xpipe-ptb" do
  arch arm: "arm64", intel: "x86_64"
  version "14.0-55"
  desc "XPipe PTB (Public Test Build)"
  homepage "https://xpipe.io"
  url "https://github.com/xpipe-io/xpipe-ptb/releases/download/#{version}/xpipe-installer-macos-#{arch}.pkg",
      verified: "github.com"
  sha256 arm: "7899f33c5b4e9b03209c6b2eafd394dc55f8632d2b58045d93c8b4e782964f43", intel: "3ffdb4d87c4e6e71ac66cac928ef37eda127bdc5c6a11a80d57dbf3f2f1a6e22"
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
