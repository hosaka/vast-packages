#!/bin/bash
# Forgejo generic package registry helpers.
# Requires: FORGEJO_URL, XBPS_UPLOAD_TOKEN, FORGEJO_REPOSITORY_OWNER

set -e

FORGEJO_URL="${FORGEJO_URL:-https://code.hosaka.cc}"
FORGEJO_REPOSITORY_OWNER="${FORGEJO_REPOSITORY_OWNER:-hosaka}"
XBPS_REPO_NAME="${XBPS_REPO_NAME:-vast-packages}"
XBPS_REPO_URL="$FORGEJO_URL/api/packages/$FORGEJO_REPOSITORY_OWNER/generic/$XBPS_REPO_NAME/current"
AUTH="Authorization: token $XBPS_UPLOAD_TOKEN"

cmd="$1"
shift

case "$cmd" in
list)
  curl --silent \
    "$FORGEJO_URL/api/v1/packages/$FORGEJO_REPOSITORY_OWNER/generic/$XBPS_REPO_NAME/current/files" |
    jq --raw-output 'if type == "array" then .[].name else empty end'
  ;;

download)
  # Usage: forgejo.sh download <filename>
  file="$1"
  echo -n "Downloading $file "
  curl --silent --fail --write-out "\n" --output "$file" "$XBPS_REPO_URL/$file"
  ;;

delete)
  # Usage: forgejo.sh delete <filename>
  file="$1"
  echo -n "Deleting $file "
  curl --silent --request DELETE --write-out "\n" --header "$AUTH" "$XBPS_REPO_URL/$file"
  ;;

upload)
  # Usage: forgejo.sh upload <filename>
  file="$1"
  echo -n "Uploading $file "
  curl --silent --request PUT --write-out "\n" --header "$AUTH" --upload-file "$file" "$XBPS_REPO_URL/$file"
  ;;

clone)
  # Usage: forgejo.sh clone <directory>
  dir="$1"
  mkdir -p "$dir"
  for file in $($0 list); do
    echo -n "Downloading $file "
    curl --silent --fail --write-out "\n" --output "$dir/$file" "$XBPS_REPO_URL/$file"
  done
  ;;

link)
  # todo: link to this repo (says repository does not exist for some reason)
  echo -n "Linking to this repo "
  curl --silent --request POST --write-out "\n" --header "$AUTH" \
    "$FORGEJO_URL/api/packages/$FORGEJO_REPOSITORY_OWNER/generic/$XBPS_REPO_NAME/-/link/$XBPS_REPO_NAME"
  ;;

*)
  echo "Usage: $0 clone <dir>|list|download <file>|delete <file>|upload <file>|link" >&2
  exit 1
  ;;
esac
