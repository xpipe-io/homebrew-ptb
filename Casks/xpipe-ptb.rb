cask "xpipe-ptb" do
  arch arm: "arm64", intel: "x86_64"
  version "10.3-1"
  desc "XPipe PTB (Public Test Build)"
  homepage "https://xpipe.io"
  url "https://github.com/xpipe-io/xpipe-ptb/releases/download/#{version}/xpipe-installer-macos-#{arch}.pkg",
      verified: "github.com"
  sha256 arm: "f0401380bd7f5ed4741b2e11a9c2f69d975a344e7c2c9aa2be21a4e73fb441cb", intel: "0eeeb377fd4c71a7cdd6545ece70b5c7b879927195f7a81a84a8ca36ce4fa580"
  name "XPipe PTB"
  auto_updates true

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on formula: "util-linux"
  depends_on formula: "netcat"

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
