
cask "pwe-mac-monitor" do
  version "1.1.0"
  sha256 "ba858379c023e3decbef8838df038f8a7e275517a5decf77d4024d92f17f87a8"

  url "https://github.com/kenshinice-ai/pwemacmonitor/releases/download/v#{version}/PWE-MAC-MONITOR-#{version}.dmg"
  name "PWE MAC MONITOR"
  desc "Menu-bar hardware monitor for Apple Silicon Macs"
  homepage "https://github.com/kenshinice-ai/pwemacmonitor"

  depends_on macos: :sonoma
  depends_on arch: :arm64

  app "PWE MAC MONITOR.app"

  zap trash: [
    "~/Library/Preferences/au.com.pwe.macmonitor.plist",
  ]
end
