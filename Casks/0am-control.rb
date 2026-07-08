cask "0am-control" do
  arch arm: "arm64", intel: "amd64"
  version "0.7.1"

  if Hardware::CPU.arm?
    sha256 "PLACEHOLDER_SHA256_DARWIN_ARM64_0AMCONTROL"
  else
    sha256 "PLACEHOLDER_SHA256_DARWIN_AMD64_0AMCONTROL"
  end

  url "https://downloads.0am.sh/0am-control-darwin-#{arch}-#{version}.zip"
  name "0am-control"
  desc "0am coordination server -- the Phase 1 control plane (Noise IK + HTTP/2)"
  homepage "https://0am.sh"

  binary "0am-control-darwin-#{arch}"

  zap trash: [
    "~/Library/Application Support/0am-control",
    "~/Library/Logs/0am-control",
    "/usr/local/etc/0am-control",
  ]

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-r", "-d", "com.apple.quarantine", "#{HOMEBREW_PREFIX}/bin/0am-control"],
                   must_succeed: false
  end
end
