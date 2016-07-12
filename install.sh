#!/bin/sh -e

mydir=$(readlink -f "$(dirname "$0")")

for f in $(ls -a "$mydir"); do
  case "$f" in
  .|..|.git|bin|README*|*.sh|*.swp|*~)
    continue
  esac

  symlink="$HOME/$f"
  if test -e "$symlink" -a ! -L "$symlink"; then
    echo "skip $f"
    continue
  else
    ln -sfn "$mydir/$f" "$symlink"
  fi
done
