# called when an interactive shell starts.

test -z "$PROMPT" && return

for i in ~/.zshrc.d ~/.zshrc.d.local ~/.shrc.d ~/.shrc.d.local; do
  for rc in "$i"/*; do
    test -f "$rc" && . "$rc"
  done
done

unset i
unset rc
