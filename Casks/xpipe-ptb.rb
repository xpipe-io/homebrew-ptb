cask "xpipe-ptb" do
  arch arm: "arm64", intel: "x86_64"
  version "15.0-39"
  desc "XPipe PTB (Public Test Build)"
  homepage "https://xpipe.io"
  url "https://github.com/xpipe-io/xpipe-ptb/releases/download/#{version}/xpipe-installer-macos-#{arch}.pkg",
      verified: "github.com"
  sha256 arm: "59d5a0747b5b8f23945f3aed2f62f85ad51aa98013e5cd7f9df8ade1dfeab8ea", intel: "4e0b48fe2f4210f540c83be53ae4a68a8cd9da0ce9a2080fbb775297abc6a260"
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
