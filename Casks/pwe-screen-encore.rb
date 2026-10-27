cask "pwe-screen-encore" do
  version "1.1.0"
  sha256 "32fedba00a2ab670912ede6f28e7dd348698c3c54e163600f60cc0aa4f21b0af"

  url "https://github.com/kenshinice-ai/pwe-imac-display/releases/download/pwe-#{version}/PWE-Screen-Encore-#{version}.dmg"
  name "PWE Screen Encore"
  desc "Use a 2014–2020 27-inch 5K iMac as an external display"
  homepage "https://pwestudio.site/screenencore/"

  livecheck do
    url :url
    regex(/^pwe[._-]v?(\d+(?:\.\d+)+)$/i)
    strategy :github_latest
  end

  depends_on macos: :sonoma

  app "PWE Screen Encore.app"
  # The receiver runs on the iMac, not here. It is installed alongside so it can be copied across.
  app "PWE Screen Encore Receiver.app"

  uninstall quit: [
    "com.pwegroup.pweimacdisplay",
    "com.pwegroup.pweimacdisplay.receiver",
  ]

  # Data folders kept their 1.0 names on purpose, so settings and pairings survive the rename.
  zap trash: [
    "~/Library/Application Support/PWE iMac Display Receiver",
    "~/Library/Application Support/PWE iMac Display",
    "~/Library/HTTPStorages/com.pwegroup.pweimacdisplay",
    "~/Library/LaunchAgents/com.pwegroup.pweimacdisplay.receiver.plist",
    "~/Library/Logs/PWE Screen Encore Receiver",
    "~/Library/Preferences/com.pwegroup.pweimacdisplay.plist",
    "~/Library/Preferences/com.pwegroup.pweimacdisplay.receiver.plist",
    "~/Library/Saved Application State/com.pwegroup.pweimacdisplay.savedState",
  ]

  caveats <<~EOS
    The receiver runs on the iMac: open the same disk image on the iMac and copy
    "PWE Screen Encore Receiver.app" to its Applications folder.
    The iMac needs macOS 11 or later; connect the two Macs with a Thunderbolt cable.
  EOS
end
