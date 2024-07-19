cask "xpipe-ptb" do
  arch arm: "arm64", intel: "x86_64"
  version "10.2-4"
  desc "XPipe PTB (Public Test Build)"
  homepage "https://xpipe.io"
  url "https://github.com/xpipe-io/xpipe-ptb/releases/download/#{version}/xpipe-installer-macos-#{arch}.pkg",
      verified: "github.com"
  sha256 arm: "647581f9b6354a18e55f4cc671e5d30dba9824e8a3f78b1efd5accfa25448a5f", intel: "cbf99b26c4d7f838840bab5cc32d1afd4ed336d3bab09f8f9f34a908c73972ad"
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
