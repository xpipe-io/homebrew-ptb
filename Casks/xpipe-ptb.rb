cask "xpipe-ptb" do
  arch arm: "arm64", intel: "x86_64"
  version "15.0-10"
  desc "XPipe PTB (Public Test Build)"
  homepage "https://xpipe.io"
  url "https://github.com/xpipe-io/xpipe-ptb/releases/download/#{version}/xpipe-installer-macos-#{arch}.pkg",
      verified: "github.com"
  sha256 arm: "de557c27a2db86944c2ad61d61476160bfce5c1b876f66eaa5d68a8b83d3d7a1", intel: "1651a8f1b40c1c1e55b7e1461621e1e5dcb94ecf6f4b52bc7b72af753f7fd1fa"
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
