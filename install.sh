#!/bin/bash -e

mydir=$(readlink -f "$(dirname "$0")")
libexec="$mydir/libexec"

# base files
for f in $(ls -a "$mydir"); do
  case "$f" in
  .|..|.git|README*|*.sh|libexec|*.swp|*~)
    continue
  esac

  symlink="$HOME/$f"
  if test -e "$symlink" -a ! -L "$symlink"; then
    echo "INFO: skip $f"
    continue
  else
    ln -sfn "$mydir/$f" "$symlink"
  fi
done

# optional modules
for name in "$@"; do
  script="$libexec/install-${name}.sh"
  if ! test -x "$script"; then
    echo "ERROR: unknown module: $name"
    exit 1
  else
    echo "INFO: install $name"
    "$script"
  fi
done
