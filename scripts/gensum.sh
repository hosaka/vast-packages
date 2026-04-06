#!/bin/bash
# gensum.sh [-i] <template|pkgdir> - update SHA256 checksums in a template
# Does not require xbps-src or void-packages, just curl and sha256sum

set -e

usage() {
  echo "Usage: $(basename "$0") [-i] <template|pkgdir>" >&2
  exit 1
}

FLAG_i=

while getopts ih flag; do
  case $flag in
  i) FLAG_i=1 ;;
  h | ?) usage ;;
  esac
done

shift $((OPTIND - 1))

[ $# -eq 0 ] && usage

# Resolve template path
arg="$1"
if [ -f "$arg" ]; then
  template="$arg"
elif [ -f "$arg/template" ]; then
  template="$arg/template"
elif [ -f "srcpkgs/$arg/template" ]; then
  template="srcpkgs/$arg/template"
else
  echo "gensum: could not find template: $arg" >&2
  exit 1
fi

# Source the template to expand all variables (version, pkgname, etc.)
. "$template"

if [ -z "$distfiles" ]; then
  echo "gensum: no distfiles in $template" >&2
  exit 1
fi

sums=""
for f in $distfiles; do
  # Strip >filename rename suffix to get the bare URL
  url="${f%%>*}"
  file="${f#*>}"
  file="${file##*/}"

  echo "Fetching $url" >&2
  sum=$(curl --silent --fail --location "$url" | sha256sum | cut -d' ' -f1)
  sums+="${sum}\n "
done

# Strip trailing newline+space
sums="${sums%\\n }"

if [ -z "$FLAG_i" ]; then
  echo "$sums"
else
  sed -i -e "/^checksum=/,/^[^ \t]/{
      /^[ \t]/d
      s/^checksum=.*/checksum=\"${sums}\"/
      /^checksum=\"[^ ]*\"/s/\"//g
    }" "$template"
  echo "gensum: updated $template" >&2
fi
