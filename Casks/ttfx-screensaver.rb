cask "ttfx-screensaver" do
  version "0.1.0"
  sha256 "9703860e494fc6a357876da6813d39e9911315f0e200960e017a149ae03ec94a"

  url "https://github.com/HiroProt/ttfx-macos-screensaver/releases/download/v#{version}/ttfx-screensaver-#{version}.zip",
      verified: "github.com/HiroProt/ttfx-macos-screensaver/"
  name "ttfx screen saver"
  desc "Terminal text effects as a screen saver"
  homepage "https://github.com/HiroProt/ttfx-macos-screensaver"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :big_sur

  screen_saver "ttfx.saver"

  # Settings live in the ByHost domain, so the filename carries a hardware UUID.
  zap trash: "~/Library/Preferences/ByHost/gg.ka.ttfx.*.plist"
end
