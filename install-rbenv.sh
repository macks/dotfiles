#!/bin/sh
RBENV_ROOT=${1:-~/.rbenv}

if test -d "$RBENV_ROOT"; then
  echo "Already exists: $RBENV_ROOT"
  exit 1
fi

git clone https://github.com/rbenv/rbenv.git "$RBENV_ROOT"

git clone https://github.com/rbenv/ruby-build.git               "$RBENV_ROOT/plugins/ruby-build"
git clone https://github.com/sstephenson/rbenv-default-gems.git "$RBENV_ROOT/plugins/rbenv-default-gems"
git clone https://github.com/rkh/rbenv-update.git               "$RBENV_ROOT/plugins/rbenv-update"

echo bundler > "$RBENV_ROOT/default-gems"
