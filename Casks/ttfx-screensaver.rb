cask "ttfx-screensaver" do
  version "0.1.5"
  sha256 "4df05b544d79ec940d1f0626f75f5b84793f1a387439bfcba12a3b60d9f37aac"

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
