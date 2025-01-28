cask "xpipe-ptb" do
  arch arm: "arm64", intel: "x86_64"
  version "15.0-12"
  desc "XPipe PTB (Public Test Build)"
  homepage "https://xpipe.io"
  url "https://github.com/xpipe-io/xpipe-ptb/releases/download/#{version}/xpipe-installer-macos-#{arch}.pkg",
      verified: "github.com"
  sha256 arm: "df306d1b91e36a485788bd9f2d685fe63c1fbedabfe90c0bd4f78f247b8c878e", intel: "8e592ad83d7abc86e16ddd4cca165ec9cdd1dd1a43ec0c16961d7d85b7b6ee6e"
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
