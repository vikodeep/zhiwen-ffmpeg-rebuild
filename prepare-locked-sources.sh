#!/usr/bin/env bash
set -euo pipefail

# Run only in an isolated disposable build directory. Never overwrite snapshots.
root="$(cd "$(dirname "$0")" && pwd)"
checkouts="${RUNNER_TEMP:?RUNNER_TEMP must name a disposable directory}/ffmpeg-checkouts"
snapshots="$root/sources"
if [[ -e "$checkouts" || -e "$snapshots" ]]; then
  echo "Source staging directory already exists; refusing to overwrite it." >&2
  exit 1
fi
mkdir -p "$checkouts" "$snapshots"
while IFS=$'\t' read -r name url commit; do
  [[ -n "$name" && "$url" == https://github.com/* && "$commit" =~ ^[0-9a-f]{40}$ ]] || exit 1
  git init --quiet "$checkouts/$name"
  git -C "$checkouts/$name" remote add origin "$url"
  git -C "$checkouts/$name" fetch --quiet --depth 1 origin "$commit"
  git -C "$checkouts/$name" checkout --quiet --detach FETCH_HEAD
  [[ "$(git -C "$checkouts/$name" rev-parse HEAD)" == "$commit" ]] || exit 1
  git -C "$checkouts/$name" submodule update --init --recursive
  git -C "$checkouts/$name" submodule status --recursive > "$checkouts/$name.submodules"
  mkdir "$snapshots/$name"
  tar --exclude-vcs -C "$checkouts/$name" -cf - . | tar -C "$snapshots/$name" -xf -
  cp "$checkouts/$name.submodules" "$snapshots/$name.submodules"
  echo "$name $commit"
done < "$root/sources.lock.tsv"
