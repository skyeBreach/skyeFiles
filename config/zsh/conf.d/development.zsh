# ==================================================================================================================== #
# Zsh Config - Languages & Package Managers
# 
#
# ==================================================================================================================== #
# Configuration

# Bun
export BUN_INSTALL_CACHE_DIR="$BUN_INSTALL/install"

# Lua Rocks
export LUAROCKS_CONFIG="$XDG_CONFIG_HOME/luarocks/config-5.1.lua"

# Node.js
export FNM_PATH="$XDG_DATA_HOME/fnm"

PNPM_HOME="$XDG_DATA_HOME/pnpm"
PATH="$PNPM_HOME:$PATH"

# ==================================================================================================================== #
# Bun

# Environment
PATH="$BUN_INSTALL/bin:$PATH"

# Completions
[ -s "$BUN_INSTALL/_bun" ] && source "$BUN_INSTALL/_bun"

# ==================================================================================================================== #
# Rust

# Environment
[ -s "$CARGO_HOME" ] && source "$CARGO_HOME/env"
export PATH="$CARGO_HOME/bin:${PATH}"

# Completions
eval "$(sqlx completions zsh)"
eval "$(dx completions zsh)"

# ==================================================================================================================== #
# Node

source /usr/share/nvm/init-nvm.sh

eval "$(npm completion)"

if [ -d "$FNM_PATH" ]; then
    export PATH="$FNM_PATH:$PATH"
    eval "$(fnm env)"
    eval "$(fnm completions)"
fi

eval "$(pnpm completion zsh)"

# ==================================================================================================================== #
# UV

eval "$(uv generate-shell-completion zsh)"
eval "$(uvx --generate-shell-completion zsh)"

# ==================================================================================================================== #
