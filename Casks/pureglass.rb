cask "pureglass" do
  version "1.1.0"
  sha256 "831de86e713cdb3919aca94eabda20d5106705ca786f49d6d447c9b7fcb0cb90"

  url "https://github.com/GRJY/PureGlass/releases/download/v#{version}/PureGlass.zip",
      verified: "github.com/GRJY/PureGlass/"
  name "PureGlass"
  desc "Native Liquid Glass Mac cleaner and system monitor for macOS 26"
  homepage "https://github.com/GRJY/PureGlass"

  depends_on macos: ">= :tahoe"

  app "PureGlass.app"

  # PureGlass is ad-hoc signed but not notarized (no paid Apple Developer
  # account), so clear the download-quarantine flag on install — otherwise
  # Gatekeeper blocks the first launch with "PureGlass is damaged".
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/PureGlass.app"]
  end

  zap trash: [
    "~/Library/Application Support/PureGlass",
    "~/Library/Caches/com.giray.pureglass",
    "~/Library/Preferences/com.giray.pureglass.plist",
    "~/Library/Saved Application State/com.giray.pureglass.savedState",
  ]
end
