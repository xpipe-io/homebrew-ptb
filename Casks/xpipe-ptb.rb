cask "xpipe-ptb" do
  arch arm: "arm64", intel: "x86_64"
  version "16.0-22"
  desc "XPipe PTB (Public Test Build)"
  homepage "https://xpipe.io"
  url "https://github.com/xpipe-io/xpipe-ptb/releases/download/#{version}/xpipe-installer-macos-#{arch}.pkg",
      verified: "github.com"
  sha256 arm: "60066e6f7aa7608ce8ae21c3fa4760ff5c0de730b8ca7a51847fc453806ac6a3", intel: "07d39f51d6e0495eef2774cdeb64c0bb2782a5b5e5ea0f703127ea7d21cfe0ab"
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
