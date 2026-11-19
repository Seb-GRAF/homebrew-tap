cask "stablebar" do
  version "0.17.0"
  sha256 "56654039236c0e24127554ae9766c9f797662dd7ea60271b008be59511157c3a"

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
