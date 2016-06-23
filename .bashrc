# vim: set ft=sh:

for d in ~/.bashrc.d ~/.bashrc.d.local ~/.shrc.d ~/.shrc.d.local; do
  for rc in "$d"/*; do
    test -r "$rc" && . "$rc"
  done
done
