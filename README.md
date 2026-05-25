# AllSecureX Quantum Homebrew Tap

Homebrew formulae for the [AllSecureX QuantumVault SDK](https://github.com/AllSecureX-Quantum/quantumvault-sdk) — post-quantum cryptography toolkit (NIST FIPS 203 / 204 / 205).

## Install

```bash
brew tap allsecurex-quantum/tap
brew install quantumvault
```

After install, every CLI binary is on `$PATH`:

```bash
quantumvault --help        # unified CLI
qvca --help                # PQC certificate authority
qvdnssec --help            # DNSSEC zone signing
qvacme-server --help       # ACME-PQC server
qvacme-client --help       # ACME-PQC client
qvjwtproxy --help          # JWT verifier sidecar
qvsmime --help             # S/MIME-style email signing
qvarchive --help           # SLH-DSA archive sealer
qvhsm --help               # PKCS#11 HSM bridge
quantum-scanner --help     # source-code crypto inventory
```

Supported platforms: **macOS arm64**, **Linux x86_64** (linuxbrew). Intel Mac binaries arrive in a later release.

## How formulae land here

The SDK repo's `release.yml` workflow renders `quantumvault.rb` on every tag and uploads it as a release asset. The current entry in `Formula/quantumvault.rb` mirrors the latest stable release.
