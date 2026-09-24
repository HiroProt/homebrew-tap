cask "ttfx-screensaver" do
  version "0.1.5"
  sha256 "4df05b544d79ec940d1f0626f75f5b84793f1a387439bfcba12a3b60d9f37aac"

  url "https://github.com/HiroProt/ttfx-macos-screensaver/releases/download/v#{version}/ttfx-screensaver-#{version}.pkg"
  name "ttfx screen saver"
  desc "Terminal text effects as a screen saver"
  homepage "https://github.com/HiroProt/ttfx-macos-screensaver"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on :macos

  # A package rather than the `screen_saver` artifact and the bare bundle.
  #
  # Homebrew quarantines what it stages, then moves it into
  # ~/Library/Screen Savers with the quarantine attribute written onto every
  # file. A quarantined screen saver is not opened, it is dlopen'd into
  # legacyScreenSaver, and that goes through a Gatekeeper gate which can
  # refuse it — "Apple could not verify 'ttfx.saver' is free of malware",
  # with no way forward in the dialog — no matter how correctly the bundle is
  # signed, notarized and stapled.
  #
  # Files an installer lays down carry no quarantine at all, so installing
  # this way means that gate is never consulted. The package accepts either
  # domain; Homebrew always installs with `-target /`, so it lands in
  # /Library/Screen Savers.
  pkg "ttfx-screensaver-#{version}.pkg"

  uninstall pkgutil: "gg.ka.ttfx",
            delete:  "/Library/Screen Savers/ttfx.saver"

  # Settings live in the ByHost domain, so the filename carries a hardware UUID.
  zap trash: "~/Library/Preferences/ByHost/gg.ka.ttfx.*.plist"
end
