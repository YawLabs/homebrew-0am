cask "0am-relay" do
  arch arm: "arm64", intel: "amd64"
  version "0.7.1"

  if Hardware::CPU.arm?
    sha256 "PLACEHOLDER_SHA256_DARWIN_ARM64_0AMRELAY"
  else
    sha256 "PLACEHOLDER_SHA256_DARWIN_AMD64_0AMRELAY"
  end

  url "https://downloads.0am.sh/0am-relay-darwin-#{arch}-#{version}.zip"
  name "0am-relay"
  desc "0am relay -- DERP-style TCP fallback relay with disco capability tokens"
  homepage "https://0am.sh"

  binary "0am-relay-darwin-#{arch}"

  zap trash: [
    "~/Library/Application Support/0am-relay",
    "~/Library/Logs/0am-relay",
  ]

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-r", "-d", "com.apple.quarantine", "#{HOMEBREW_PREFIX}/bin/0am-relay"],
                   must_succeed: false
  end
end
