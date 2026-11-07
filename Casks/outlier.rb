cask "outlier" do
  version "1.11.1000"
  sha256 "540e3de374a5f7d9c3094dd2bfb00a85d178af4050633ec6364ce8691c3db022"

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
