cask "outlier" do
  version "1.11.1012"
  sha256 "0302b51161d7bc8da5841783fd4f7be2b2d52018ad4e99010e6e55d6e8c3f01d"

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
