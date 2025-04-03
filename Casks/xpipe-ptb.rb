cask "xpipe-ptb" do
  arch arm: "arm64", intel: "x86_64"
  version "16.0-10"
  desc "XPipe PTB (Public Test Build)"
  homepage "https://xpipe.io"
  url "https://github.com/xpipe-io/xpipe-ptb/releases/download/#{version}/xpipe-installer-macos-#{arch}.pkg",
      verified: "github.com"
  sha256 arm: "809f13f7e7c92126b0e2ca2a3e4bcb58e18d6923afbbd7a84bfaf6d5eadf41be", intel: "a8f7bbe9800652a409ff8c38425affbfd8a3e8bd84448e29b1eb8bfecc29a775"
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
