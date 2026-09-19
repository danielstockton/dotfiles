source ~/.bash/paths
source ~/.bash/aliases
source ~/.bash/config

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
. "$HOME/.cargo/env"

# Written by the uv/astral installer; present on the MacBook, not on Ubuntu.
[ -f "$HOME/.local/bin/env" ] && . "$HOME/.local/bin/env"

# Added by LM Studio CLI (lms)
[ -d "$HOME/.lmstudio/bin" ] && export PATH="$PATH:$HOME/.lmstudio/bin"
