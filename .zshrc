# called when an interactive shell starts.

for rc in "$HOME"/.profile.d/* "$HOME"/.profile.d.local/* "$HOME"/.zshrc.d/* "$HOME"/.zshrc.d.local/*; do
  test -f "$rc" && . "$rc"
done
