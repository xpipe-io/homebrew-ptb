cask "xpipe-ptb" do
  arch arm: "arm64", intel: "x86_64"
  version "11.0-13"
  desc "XPipe PTB (Public Test Build)"
  homepage "https://xpipe.io"
  url "https://github.com/xpipe-io/xpipe-ptb/releases/download/#{version}/xpipe-installer-macos-#{arch}.pkg",
      verified: "github.com"
  sha256 arm: "d6b28f70e4721c79bf3715543deafdddffdfd662bd20ea1eac5ea2e40ee3bbff", intel: "48fb323bc7513b385e4b509fef624f0d3d85087705b114289d6a7f6975bca2ce"
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
