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

# .ssh directory
if ! test -e "$HOME/.ssh"; then
  mkdir "$HOME/.ssh"
  chmod 700 "$HOME/.ssh"
  mkdir "$HOME/.ssh/sockets"

  cat > "$HOME/.ssh/config" <<EOS
ForwardAgent yes
ServerAliveInterval 120

Host *
  ControlMaster auto
  ControlPath ~/.ssh/sockets/%r@%h:%p
EOS
fi

# .vimrc
if ! test -e "$HOME/.vimrc.local.plugins"; then
  cat > "$HOME/.vimrc.local.plugins" <<EOS
" Plug 'pangloss/vim-javascript'
" Plug 'posva/vim-vue'
" Plug 'mxw/vim-jsx'

" Plug 'uarun/vim-protobuf'
" Plug 'tpope/vim-haml'
" Plug 'pearofducks/ansible-vim'
EOS
fi
