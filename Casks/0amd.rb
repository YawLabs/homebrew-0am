cask "0amd" do
  arch arm: "arm64", intel: "x64"
  version "0.0.0-dev"

  if Hardware::CPU.arm?
    sha256 "PLACEHOLDER_SHA256_DARWIN_ARM64"
  else
    sha256 "PLACEHOLDER_SHA256_DARWIN_X64"
  end

  url "https://downloads.0am.sh/0amd-darwin-#{arch}-#{version}.zip"
  name "0amd"
  desc "0am node daemon -- the user-side WireGuard mesh daemon"
  homepage "https://0am.sh"

  binary "0amd-darwin-#{arch}"

  zap trash: [
    "~/Library/Application Support/0am",
    "~/Library/Logs/0amd",
    "~/.config/0am",
  ]

  # 0am is ad-hoc signed, not notarized, so Homebrew's download-quarantine bit
  # trips Gatekeeper. Strip it after install/upgrade so the daemon launches
  # without a manual `xattr -cr`. Remove this once the binary is notarized
  # (the real fix; see homebrew-yaw Casks/yaw.rb for the same posture).
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-r", "-d", "com.apple.quarantine", "#{appdir}/0amd"],
                   must_succeed: false
  end
end
