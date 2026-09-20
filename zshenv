export EDITOR=vim
export JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64
export ANDROID_HOME=/home/dan/Android/Sdk

# zshenv is sourced by EVERY zsh - login, interactive, scripts and nested
# shells alike - so the unguarded appends below used to stack up: PATH grew to
# 48-54 entries with the same block repeated 4-5 times. Tying `path` to `PATH`
# as a unique array makes duplicates collapse automatically.
typeset -U path PATH

# User-local binaries: claude, uv, ruff, aider, cursor-agent, mscore4.
path=("$HOME/.local/bin" $path)

# Machine-admin tools (Linux only - the Mac is not administered this way).
[[ "$OSTYPE" == linux* ]] && [ -d "$HOME/ops/bin" ] && path=("$HOME/ops/bin" $path)

export PATH=$PATH:$HOME/bin/:$HOME/.lein:$HOME/.rbenv/bin:$HOME/code/flutter/bin
export PATH=$PATH:${ANDROID_HOME}/emulator
export PATH=$PATH:${ANDROID_HOME}/tools
export PATH=$PATH:${ANDROID_HOME}/platform-tools
. "$HOME/.cargo/env"
