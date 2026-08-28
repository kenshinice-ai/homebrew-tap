cask "pwe-mac-monitor" do
  version "1.1.1"
  sha256 "4a71b7ba5051deb996c43b66a446723a9a28172cc40562dad4c3587256359890"

  url "https://github.com/kenshinice-ai/pwemacmonitor/releases/download/v#{version}/PWE-MAC-MONITOR-#{version}.dmg"
  name "PWE MAC MONITOR"
  desc "Menu-bar hardware monitor for Apple Silicon Macs"
  homepage "https://github.com/kenshinice-ai/pwemacmonitor"

  depends_on macos: :sonoma
  depends_on arch: :arm64

  app "PWE MAC MONITOR.app"

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
