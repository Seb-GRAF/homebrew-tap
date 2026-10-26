cask "stablebar" do
  version "0.8.0"
  sha256 "c3f3a09eee856eeecd78c1bef7debf381a01cb2fc9c7a5cf9070ed359bce0840"

  url "https://github.com/Seb-GRAF/StableBar/releases/download/v#{version}/StableBar.dmg"
  name "StableBar"
  desc "Native, configurable menu bar"
  homepage "https://stablebar.app/"

  auto_updates true
  depends_on arch: :arm64
  depends_on macos: :sonoma

  app "StableBar.app"

  # StableBar's own uninstall turns off the menu bar auto-hide that its setup turned on, turns off Open at login,
  # removes its stablebar command and Keychain items and resets its permissions. When the app is gone or predates
  # --uninstall, the script turns off that auto-hide and deletes the Keychain items itself.
  zap script: {
        executable:   "/bin/sh",
        args:         ["-c", <<~SH, "sh", "#{appdir}/StableBar.app/Contents/MacOS/StableBar"],
          if [ -x "$1" ] && "$1" --help | grep -q -- --uninstall; then
            exec "$1" --uninstall --yes
          fi
          if [ "$(defaults read org.stablebar.app turnedOnMenuBarAutoHide 2>/dev/null)" = 1 ] &&
             [ "$(defaults read -g _HIHideMenuBar 2>/dev/null)" = 1 ]; then
            osascript -e 'tell application "System Events" to set autohide menu bar of dock preferences to false'
          fi
          i=0
          while [ "$i" -lt 100 ] && security delete-generic-password -s StableBar >/dev/null 2>&1; do
            i=$((i + 1))
          done
        SH
        must_succeed: false,
      },
      trash:  [
        "~/.config/stablebar",
        "~/Library/Caches/org.stablebar.app",
        "~/Library/Caches/org.stablebar.app.sparkle",
        "~/Library/Caches/StableBar",
        "~/Library/HTTPStorages/org.stablebar.app",
        "~/Library/Preferences/org.stablebar.app.plist",
      ]
end
