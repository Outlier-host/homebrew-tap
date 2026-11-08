cask "outlier" do
  version "1.11.1001"
  sha256 "2f8d928bd09a4d88cd38b5f85d7f7499dd47ab825db0a983b1330c5fef5cb368"

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
