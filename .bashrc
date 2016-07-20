# vim: set ft=sh:

for i in ~/.bashrc.d ~/.bashrc.d.local ~/.shrc.d ~/.shrc.d.local; do
  for rc in "$i"/*; do
    test -f "$rc" && . "$rc"
  done
done

unset i
unset rc
