# called when an interactive shell starts.

for d in ~/.zshrc.d ~/.zshrc.d.local ~/.shrc.d ~/.shrc.d.local; do
  for rc in "$d"/*; do
    test -r "$rc" && . "$rc"
  done
done
