#!/bin/bash
# Bootstrap machine-admin tooling on a Linux box.
# LINUX ONLY - the Mac is not administered this way, so this exits early there.
set -euo pipefail

case "$OSTYPE" in
  linux*) ;;
  *) echo "Not Linux ($OSTYPE) - nothing to do. The Mac is not managed this way."; exit 0 ;;
esac

DOTFILES="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

echo "==> Linking ~/ops -> $DOTFILES/ops"
if [ -e "$HOME/ops" ] && [ ! -L "$HOME/ops" ]; then
  echo "    ~/ops exists and is not a symlink - move it aside first"; exit 1
fi
ln -sfn "$DOTFILES/ops" "$HOME/ops"

echo "==> Linking ~/AGENTS.md -> ops/AGENTS.md"
ln -sfn "$DOTFILES/ops/AGENTS.md" "$HOME/AGENTS.md"

echo "==> Creating untracked local/ for machine-specific notes"
mkdir -p "$DOTFILES/ops/local/backups"
[ -f "$DOTFILES/ops/local/MACHINE.md" ] || cat > "$DOTFILES/ops/local/MACHINE.md" <<'TPL'
# <hostname> — machine facts

Untracked: true only of this machine. Hardware, disk UUIDs, past incidents,
exact working config, and dead ends worth not repeating.
TPL

echo "==> Linking personal tools into ~/.local/bin (not ~/bin - that holds apps)"
mkdir -p "$HOME/.local/bin"
for t in "$DOTFILES"/tools/*; do
  [ -f "$t" ] && ln -sfn "$t" "$HOME/.local/bin/$(basename "$t")"
done

echo "==> Optional prerequisites:"
for p in smartmontools lm-sensors ffmpeg; do
  dpkg-query -W "$p" >/dev/null 2>&1 && echo "    OK      $p" || echo "    missing $p  (sudo apt install $p)"
done

echo
echo "Done. ~/ops/bin is added to PATH by zshenv on Linux."
