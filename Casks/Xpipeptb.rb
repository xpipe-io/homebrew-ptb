cask "xpipe-ptb" do
  arch arm: "arm64", intel: "x86_64"
  version "10.2-5"
  desc "XPipe PTB (Public Test Build)"
  homepage "https://xpipe.io"
  url "https://github.com/xpipe-io/xpipe-ptb/releases/download/#{version}/xpipe-installer-macos-#{arch}.pkg",
      verified: "github.com"
  sha256 arm: "025200ea8d519c4b414639ebfd8aea030d6d9c990c630f44db2b1c6bd56526de", intel: "1d026dd0aa461b5cd81e805f987d24a0d05bc6b2c4dd651caf1d149c3186d89f"
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
