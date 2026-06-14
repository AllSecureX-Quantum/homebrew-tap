# Homebrew formula for QuantumVault SDK.
#
# This file is rendered from the template in the SDK repo
# (.github/workflows/release.yml renders version + per-arch SHA-256
# placeholders against the actual release assets). The rendered file
# lives here in the tap repo so `brew tap allsecurex-quantum/tap`
# resolves it.
#
# Users install with:
#
#   brew tap allsecurex-quantum/tap
#   brew install quantumvault
#
# Apple Silicon and Linux x86_64 are covered. Intel macOS users on
# linuxbrew install the Linux build.
#
# Formula style follows the Homebrew best-practice for binary releases
# (the `binary` audit-style - no Ruby `def install` build steps, just
# a `bin.install` of pre-built artefacts from GitHub Releases).

class Quantumvault < Formula
  desc "Post-quantum cryptography toolkit: CA, DNSSEC, S/MIME, archival, ACME, JWT, HSM bridge"
  homepage "https://quantumvault.allsecurex.com"
  version "1.1.3"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/AllSecureX-Quantum/quantumvault-sdk/releases/download/v1.1.3/quantumvault-v1.1.3-aarch64-apple-darwin.tar.gz"
      sha256 "25540630ffa2d0bf91875bdc1349978cc7166b9fc67720831ccee4f1d5450fb6"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/AllSecureX-Quantum/quantumvault-sdk/releases/download/v1.1.3/quantumvault-v1.1.3-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "310d039e38456b605e2c8268dda660c5ffd96cf9bdf8fcad4ba30d165e587f43"
    end
  end

  def install
    # Brew cd's into the extracted top-level directory before install runs.
    bin.install "quantumvault"
    bin.install "qvca"
    bin.install "qvdnssec"
    bin.install "qvsmime"
    bin.install "qvarchive"
    bin.install "qvjwtproxy"
    bin.install "qvacme-server"
    bin.install "qvacme-client"
    bin.install "qvhsm"
    bin.install "quantum-scanner"
  end

  test do
    # Smoke: list bundled tools through the unified CLI. This proves
    # both the CLI was extracted and that it can locate its siblings
    # in the same Cellar bin/ directory.
    assert_match "bundled tools", shell_output("#{bin}/quantumvault tools list --format json")

    # Each of the wrapped binaries should respond to its own help flag.
    %w[qvca qvdnssec qvsmime qvarchive qvjwtproxy qvacme-server qvacme-client qvhsm].each do |b|
      system "#{bin}/#{b}", "--help"
    end
  end
end
