cask "stablebar" do
  version "0.10.0"
  sha256 "c5f03c5f6037506563de9cc0d9759cf99569fe8dc6feba26d4a763df3f11b560"

  url "https://github.com/Seb-GRAF/StableBar/releases/download/v#{version}/StableBar.dmg"
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
