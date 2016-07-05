#!/bin/sh -e

myname=$(basename "$0")
mydir=$(readlink -f "$(dirname "$0")")

for f in $(ls -a "$mydir"); do
  case "$f" in
  .|..|.git|README*|$myname|*.swp|*~)
    continue
  esac

  symlink="$HOME/$f"
  test -e "$symlink" -a ! -L "$symlink" && continue

  echo "install $f"
  ln -sfn "$mydir/$f" "$symlink"
done
