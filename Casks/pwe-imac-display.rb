cask "pwe-imac-display" do
  version "1.0.0"
  sha256 "2a24e97cc751aba87f0208bf86e8f47cb50a48f4c613783de29fef522671b290"

  url "https://github.com/kenshinice-ai/pwe-imac-display/releases/download/pwe-#{version}/PWE-iMac-Display-#{version}.dmg"
  name "PWE iMac Display"
  desc "Use a 2014–2017 5K iMac as an external display"
  homepage "https://github.com/kenshinice-ai/pwe-imac-display"

  livecheck do
    url :url
    regex(/^pwe[._-]v?(\d+(?:\.\d+)+)$/i)
    strategy :github_latest
  end

  depends_on macos: :sonoma

  app "PWE iMac Display.app"
  # The receiver runs on the iMac, not here. It is installed alongside so it can be copied across.
  app "PWE iMac Display Receiver.app"

  uninstall quit: [
    "com.pwegroup.pweimacdisplay",
    "com.pwegroup.pweimacdisplay.receiver",
  ]

  zap trash: [
    "~/Library/Application Support/PWE iMac Display Receiver",
    "~/Library/Application Support/PWE iMac Display",
    "~/Library/Preferences/com.pwegroup.pweimacdisplay.plist",
    "~/Library/Preferences/com.pwegroup.pweimacdisplay.receiver.plist",
  ]

  caveats <<~EOS
    Copy "PWE iMac Display Receiver.app" from /Applications to the iMac and open it there.
    The iMac needs macOS 11 or later; connect the two Macs with a Thunderbolt cable.
  EOS
end
