# vast-packages

This repository contains my personal XBPS source packages collection to build binary packages for the Void Linux distribution. It mainly contains packages that cannot get accepted in the official [void-packages](https://github.com/void-linux/void-packages) repository according to the [Manual](https://github.com/void-linux/void-packages/blob/master/Manual.md).

## Upstream

- `openpgp-card-tools-git`: [PR](https://github.com/void-linux/void-packages/pull/58914)
- `prek`: [PR](https://github.com/void-linux/void-packages/pull/59152)

## Wishlist

- [bob](https://github.com/MordechaiHadad/bob)
- [feishin](https://github.com/jeffvli/feishin): upstream will treat this with "electron 🤮"
- [font-monaspace](https://github.com/githubnext/monaspace)
- [hadolint](https://github.com/hadolint/hadolint)
- [just-lsp](https://github.com/terror/just-lsp)
- [limine-entry-tool](https://gitlab.com/Zesko/limine-entry-tool): requires GraalVM 25 but void packages [Mandrel 23](https://github.com/void-linux/void-packages/tree/master/srcpkgs/mandrel)
- [limine-snapper-sync](https://gitlab.com/Zesko/limine-snapper-sync): same issue as above
- [marksman](https://github.com/artempyanykh/marksman): could try using Mono or wait for dotnet to be packaged upstream
