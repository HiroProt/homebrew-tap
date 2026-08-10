cask "ttfx-screensaver" do
  version "0.1.4"
  sha256 "1586ac162d3b4d2b3dede203dae8c45292920644ec4af73be19b318f49ba7fef"

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
