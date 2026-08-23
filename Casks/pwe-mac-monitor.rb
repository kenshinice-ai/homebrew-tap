cask "pwe-mac-monitor" do
  version "1.0.0"
  sha256 "5229307edd5b28880d353bf8fcb2b1e10dafa52d745837029fa51e4e26dce7f0"

  url "https://github.com/kenshinice-ai/pwemacmonitor/releases/download/v#{version}/PWE-MAC-MONITOR-#{version}.dmg"
  name "PWE MAC MONITOR"
  desc "Menu-bar hardware monitor for Apple Silicon Macs"
  homepage "https://github.com/kenshinice-ai/pwemacmonitor"

  depends_on macos: ">= :sonoma"
  depends_on arch: :arm64

  app "PWE MAC MONITOR.app"

  zap trash: [
    "~/Library/Preferences/au.com.pwe.macmonitor.plist",
  ]
end
