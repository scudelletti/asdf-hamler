#!/usr/bin/env bash

set -euo pipefail

GH_REPO="https://github.com/hamler-lang/hamler"

get_architecture() {
  uname | tr '[:upper:]' '[:lower:]'
}

ARCHITECTURE=$(get_architecture)

if [ "$ARCHITECTURE" = "linux" ]; then
  if [ -n "${GITHUB_API_TOKEN:-}" ]; then
    curl_opts=("${curl_opts[@]}" -H "Authorization: token $GITHUB_API_TOKEN")
  fi
fi

curl_opts=(-fsSL)

fail() {
  echo -e "asdf-hamler: $*"
  exit 1
}

sort_versions() {
  sed 'h; s/[+-]/./g; s/.p\([[:digit:]]\)/.z\1/; s/$/.z/; G; s/\n/ /' |
    LC_ALL=C sort -t. -k 1,1 -k 2,2n -k 3,3n -k 4,4n -k 5,5n | awk '{print $2}'
}

list_github_tags() {
  git ls-remote --tags --refs "$GH_REPO" |
    grep -o 'refs/tags/.*' | cut -d/ -f3- | grep v |
    sed 's/^v//' # NOTE: You might want to adapt this sed to remove non-version strings from tags
}

list_all_versions() {
  list_github_tags
}

download_release() {
  local version filename url
  version="$1"
  filename="$2"

  if [ "$ARCHITECTURE" = "darwin" ]; then
    url="https://s3-us-west-2.amazonaws.com/packages.emqx.io/hamler/homebrew/hamler-${version}.tgz"
  else
    url="$GH_REPO/releases/download/${version}/hamler-${version}.tgz"
  fi

  echo "* Downloading hamler release $version..."
  curl "${curl_opts[@]}" -o "$filename" -C - "$url" || fail "Could not download $url"
}

install_version() {
  local install_type="$1"
  local version="$2"
  local install_path="$3"

  if [ "$install_type" != "version" ]; then
    fail "asdf-hamler supports release installs only"
  fi

  local release_file="$install_path/hamler-$version.tgz"

  (
    mkdir -p "$install_path"
    download_release "$version" "$release_file"
    tar -xf "$release_file" -C "$install_path" --strip-components=1 || fail "Could not extract $release_file"
    rm "$release_file"

    local tool_cmd
    tool_cmd="hamler"
    test -x "$install_path/bin/$tool_cmd" || fail "Expected $install_path/bin/$tool_cmd to be executable."
    echo "hamler $version installation was successful!"
  ) || (
    rm -rf "$install_path"

    fail "An error ocurred while installing hamler $version."
  )
}
