# vast-packages

This repository contains my personal XBPS source packages collection to build binary packages for the Void Linux distribution. It mainly contains packages that cannot get accepted in the official [void-packages](https://github.com/void-linux/void-packages) repository according to the [Manual](https://github.com/void-linux/void-packages/blob/master/Manual.md).

## Binary Repo
A binary repository is hosted using a [Generic Package Registry](https://forgejo.org/docs/latest/user/packages/generic/). Packages added to srcpkgs/ are automatically built, signed and deployed via a CI workflow. Add this repository to XBPS:
```bash
echo "repository=https://hosaka.cc/void/current" > /etc/xbps.d/42-hosaka.conf
```

Install packages using `xbps-install` as usual:
```bash
xbps-install -S <package>
```

## Upstream

When a package can be submitted to the official repos, a PR is opened. If and when a PR gets merged, the package will be removed from this repo. If a removed package has previously been installed via `xbps-install` from this repository the package manager will fallback to the official repo automatically.

- `bob`: [PR](https://github.com/void-linux/void-packages/pull/59155) [Merged](https://github.com/void-linux/void-packages/blob/master/srcpkgs/bob/template)
- `just-lsp`: [PR](https://github.com/void-linux/void-packages/pull/59161) [Merged](https://github.com/void-linux/void-packages/blob/master/srcpkgs/just-lsp/template)
- `openpgp-card-tools-git`: [PR](https://github.com/void-linux/void-packages/pull/58914) [Merged](https://github.com/void-linux/void-packages/blob/master/srcpkgs/openpgp-card-tool-git/template)
- `prek`: [PR](https://github.com/void-linux/void-packages/pull/59152) [Merged](https://github.com/void-linux/void-packages/blob/master/srcpkgs/prek/template)
- `yaml-language-server`: [PR](https://github.com/void-linux/void-packages/pull/59196) [Merged](https://github.com/void-linux/void-packages/blob/master/srcpkgs/yaml-language-server/template)

## Wishlist

- [feishin](https://github.com/jeffvli/feishin): upstream will treat this with "electron 🤮"
- [font-monaspace](https://github.com/githubnext/monaspace)
- [font-maple](https://github.com/subframe7536/maple-font)
- [hadolint](https://github.com/hadolint/hadolint): requires GHC 9.10.2 (base >= 4.20.1) but void packages [GHC 9.8.4](https://github.com/void-linux/void-packages/tree/master/srcpkgs/ghc)
- [limine-entry-tool](https://gitlab.com/Zesko/limine-entry-tool): requires GraalVM 25 but void packages [Mandrel 23](https://github.com/void-linux/void-packages/tree/master/srcpkgs/mandrel)
- [limine-snapper-sync](https://gitlab.com/Zesko/limine-snapper-sync): same issue as above
- [marksman](https://github.com/artempyanykh/marksman): could try using Mono or wait for dotnet to be packaged upstream

## Mirrors
This repository is hosted on [Forgejo](https://code.hosaka.cc/hosaka/vast-packages) which mirrors to the following git forges:
- [<img src="https://raw.githubusercontent.com/humanetech-community/awesome-humane-tech/main/logo/codeberg.svg?sanitize=true" width="16"/>](https://codeberg.org/hosaka/vast-packages) - https://codeberg.org/hosaka/vast-packages
- [<img src="https://raw.githubusercontent.com/humanetech-community/awesome-humane-tech/main/logo/github.svg?sanitize=true" width="16"/>](https://github.com/hosaka/vast-packages) - https://github.com/hosaka/vast-packages

