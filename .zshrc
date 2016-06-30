# called when an interactive shell starts.

for i in ~/.zshrc.d ~/.zshrc.d.local ~/.shrc.d ~/.shrc.d.local; do
  for rc in "$i"/*; do
    test -r "$rc" && . "$rc"
  done
done

unset i
unset rc
