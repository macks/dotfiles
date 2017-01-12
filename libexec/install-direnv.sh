#!/bin/sh -e
bindir=${1:-~/bin}
tmpdir=$(mktemp -d)

git clone --depth 1 https://github.com/direnv/direnv "$tmpdir/direnv"
make -C "$tmpdir/direnv"
mkdir -p "$bindir"
cp "$tmpdir/direnv/direnv" "$bindir"
rm -rf "$tmpdir"
