cask "xpipe-ptb" do
  arch arm: "arm64", intel: "x86_64"
  version "10.1-9"
  desc "XPipe PTB (Public Test Build)"
  homepage "https://xpipe.io"
  url "https://github.com/xpipe-io/xpipe-ptb/releases/download/#{version}/xpipe-installer-macos-#{arch}.pkg",
      verified: "github.com"
  sha256 arm: "0278c15013c6d691d4a745776d69f068f714a410f3a4aef4997dfb002f5f3e72", intel: "be834946d1b8be4261b1961cfe28de08f3eafbfe9b5ecd88de15817b7da5ed86"
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
