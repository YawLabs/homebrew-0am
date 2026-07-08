# homebrew-0am

Homebrew tap for [0am](https://0am.sh) -- a self-hosted WireGuard mesh VPN
(control plane, NAT traversal, and relay fleet, all our own).

This tap ships the macOS binaries for the three 0am daemons:

| Cask          | Binary       | Purpose                                           |
| ------------- | ------------ | ------------------------------------------------- |
| `0amd`        | `0amd`       | The user-side WireGuard mesh daemon               |
| `0am-control` | `0am-control`| The Phase 1 coordination server (Noise IK + HTTP/2) |
| `0am-relay`   | `0am-relay`  | The DERP-style TCP fallback relay                 |

Install one of:

```sh
brew tap yawlabs/0am
brew install --cask 0amd
# or
brew install --cask 0am-control
# or
brew install --cask 0am-relay
```

This tap is updated by `release.sh` in the [0am](https://github.com/YawLabs/zero-am)
repo at every release. Do not hand-edit `Casks/*.rb` -- the release script
rewrites version + sha256 atomically.
