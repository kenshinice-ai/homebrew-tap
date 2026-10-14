cask "pwe-mac-monitor" do
  version "1.7.1"
  sha256 "f232354fcbc3fd963babecb85798ddb1e7cc9db9b8f70155411f99c019450d60"

  url "https://github.com/kenshinice-ai/pwemacmonitor/releases/download/v#{version}/PWE-MAC-MONITOR-#{version}.dmg"
  name "PWE Monitor"
  desc "Menu-bar hardware monitor for Apple Silicon Macs"
  homepage "https://github.com/kenshinice-ai/pwemacmonitor"

  depends_on macos: :sonoma
  depends_on arch: :arm64

  # Renamed in 1.4.0. An upgrade from an older cask removes the old bundle, because Homebrew
  # uninstalls using the definition saved at install time — which still names the old app.
  app "PWE Monitor.app"

  # This one lives in the menu bar and is therefore almost always running when an upgrade
  # arrives. Without this, brew replaces the bundle underneath the running process: the old
  # code keeps running, the menu bar keeps showing the old version, and the upgrade looks
  # like it silently did nothing.
  uninstall quit: "au.com.pwe.macmonitor"

  zap trash: [
    "~/Library/Caches/au.com.pwe.macmonitor",
    "~/Library/HTTPStorages/au.com.pwe.macmonitor",
    "~/Library/Preferences/au.com.pwe.macmonitor.plist",
  ]
end
