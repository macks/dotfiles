# called when an interactive shell starts.

for rc in "$HOME"/.zshrc.d/* "$HOME"/.zshrc.d.local/*; do
  test -f "$rc" && . "$rc"
done
