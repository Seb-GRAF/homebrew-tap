cask "stablebar" do
  version "0.18.0"
  sha256 "280476b9417bd9181484908c9557f537cda4f867dd3c3ae2d22b0ba3895edc16"

  url "https://github.com/stablebox/StableBar/releases/download/v#{version}/StableBar.dmg"
  name "StableBar"
  desc "Native, configurable menu bar"
  homepage "https://stablebar.app/"

  auto_updates true
  depends_on arch: :arm64
  depends_on macos: :sonoma

  app "StableBar.app"

  zap trash: [
    "~/.config/stablebar",
    "~/Library/Caches/org.stablebar.app",
    "~/Library/Caches/org.stablebar.app.sparkle",
    "~/Library/Caches/StableBar",
    "~/Library/HTTPStorages/org.stablebar.app",
    "~/Library/Preferences/org.stablebar.app.plist",
  ]
end
