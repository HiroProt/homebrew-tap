cask "ttfx-screensaver" do
  version "0.1.1"
  sha256 "1a46316ac1684d77edeeb340096a1bb19e717c6af2e823697697f6dd1e962b24"

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
