cask "microsoft-auto-update" do
  version "4.39.21091200"
  sha256 "e6d45f0f0010f67638f199ce8757739f26e703f3d472ef482bec2175ab7d85b7"

  url "https://officecdn-microsoft-com.akamaized.net/pr/C1297A47-86C4-4C1F-97FA-950631F94777/MacAutoupdate/Microsoft_AutoUpdate_#{version}_Updater.pkg",
      verified: "officecdn-microsoft-com.akamaized.net/"
  name "Microsoft Auto Update"
  desc "Provides updates to various Microsoft products"
  homepage "https://docs.microsoft.com/officeupdates/release-history-microsoft-autoupdate"

  livecheck do
    url "https://go.microsoft.com/fwlink/?linkid=830196"
    strategy :header_match
  end

  auto_updates true

  pkg "Microsoft_AutoUpdate_#{version}_Updater.pkg"

  uninstall quit:      [
    "com.microsoft.autoupdate2",
    "com.microsoft.autoupdate.fba",
    "com.microsoft.errorreporting",
  ],
            launchctl: [
              "com.microsoft.autoupdate.helpertool",
              "com.microsoft.autoupdate.helper",
              "com.microsoft.update.agent",
            ],
            pkgutil:   [
              "com.microsoft.package.Microsoft_AutoUpdate.app",
              "com.microsoft.package.Microsoft_AU_Bootstrapper.app",
            ],
            delete:    "/Library/PrivilegedHelperTools/com.microsoft.autoupdate.helper"

  zap trash: [
    "~/Library/Application Support/Microsoft AutoUpdate",
    "~/Library/Caches/Microsoft/uls/com.microsoft.autoupdate.fba",
    "~/Library/Caches/Microsoft/uls/com.microsoft.autoupdate2",
    "~/Library/Caches/com.microsoft.autoupdate.fba",
    "~/Library/Caches/com.microsoft.autoupdate2",
    "~/Library/Cookies/com.microsoft.autoupdate.fba.binarycookies",
    "~/Library/Cookies/com.microsoft.autoupdate2.binarycookies",
    "~/Library/Preferences/com.microsoft.autoupdate.fba.plist",
    "~/Library/Preferences/com.microsoft.autoupdate2.plist",
    "~/Library/Saved Application State/com.microsoft.autoupdate2.savedState",
  ],
      rmdir: [
        "~/Library/Caches/Microsoft/uls",
        "~/Library/Caches/Microsoft",
      ]
end
