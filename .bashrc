# vim: set ft=sh:

test -z "$PS1" && return

for i in ~/.bashrc.d ~/.bashrc.d.local ~/.shrc.d ~/.shrc.d.local; do
  for rc in "$i"/*; do
    test -f "$rc" && . "$rc"
  done
done

unset i
unset rc
