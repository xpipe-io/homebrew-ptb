cask "xpipe-ptb" do
  arch arm: "arm64", intel: "x86_64"
  version "15.0-28"
  desc "XPipe PTB (Public Test Build)"
  homepage "https://xpipe.io"
  url "https://github.com/xpipe-io/xpipe-ptb/releases/download/#{version}/xpipe-installer-macos-#{arch}.pkg",
      verified: "github.com"
  sha256 arm: "75c8a95fe4d0a06360ea800fa9d2258de3a14711e8fbc447758ac0f84cb40132", intel: "6a0b4436de53b9e6590594e537b3c86b227e60e0803b553e79d639cf7048d7e5"
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
