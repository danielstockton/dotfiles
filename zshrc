. ~/.zsh/config
. ~/.zsh/aliases
. ~/.zsh/completion

# Written by the uv/astral installer; present on the MacBook, not on Ubuntu.
[ -f "$HOME/.local/bin/env" ] && . "$HOME/.local/bin/env"

# pnpm - only where it is actually installed (Ubuntu today, not the Mac)
export PNPM_HOME="$HOME/.local/share/pnpm"
if [ -d "$PNPM_HOME" ]; then
  case ":$PATH:" in
    *":$PNPM_HOME:"*) ;;
    *) export PATH="$PNPM_HOME:$PATH" ;;
  esac
fi
