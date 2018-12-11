#!/bin/bash
RBENV_ROOT=${1:-~/.rbenv}

RBENV_PLUGINS="
https://github.com/rbenv/ruby-build.git
https://github.com/rkh/rbenv-update.git
"

if test -d "$RBENV_ROOT"; then
  echo "Already exists: $RBENV_ROOT"
  exit 1
fi

git clone --depth 1 https://github.com/rbenv/rbenv.git "$RBENV_ROOT"

for url in $RBENV_PLUGINS; do
  git clone --depth 1 $url "$RBENV_ROOT/plugins/$(basename "$url" .git)"
done
