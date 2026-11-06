cask "outlier" do
  version "1.11.999"
  sha256 "4129abeffdfea7c6f71e9ce4aeb07ac866250fa26b0bbcc63adf9a2d5aa35dbf"

  url "https://github.com/Outlier-host/outlier-app-releases/releases/download/v#{version}/Outlier-#{version}-arm64.dmg",
      verified: "github.com/Outlier-host/outlier-app-releases/"
  name "Outlier"
  desc "Private AI chat and coding agent that runs local models"
  homepage "https://outlier.host/?utm_source=homebrew"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on arch: :arm64
  depends_on macos: :sequoia

  app "Outlier.app"

  zap trash: [
    "~/.outlier",
    "~/Library/Application Support/host.outlier.desktop",
    "~/Library/Caches/host.outlier.desktop",
    "~/Library/Preferences/host.outlier.desktop.plist",
    "~/Library/Saved Application State/host.outlier.desktop.savedState",
    "~/Library/WebKit/host.outlier.desktop",
  ]

  caveats <<~EOS
    `brew uninstall --zap outlier` also deletes ~/.outlier, which holds your chats and the AI models you downloaded.
  EOS
end
