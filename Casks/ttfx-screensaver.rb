cask "ttfx-screensaver" do
  version "0.1.3"
  sha256 "b8ee6325f9f182d6ef5b4a32179896c8cbbfd80cc80bfe3f8eaf9416e4bf85fc"

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
