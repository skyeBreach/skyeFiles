# ==================================================================================================================== #
# Zsh Config - Languages & Package Managers
# 
#
# ==================================================================================================================== #
# Configuration

# Bun
export BUN_INSTALL="$XDG_DATA_HOME/bun"
export BUN_INSTALL_CACHE_DIR="$XDG_DATA_HOME/bun/install"

# Lua Rocks
export LUAROCKS_CONFIG="$XDG_CONFIG_HOME/luarocks/config-5.1.lua"

# Rust
export CARGO_HOME="$XDG_DATA_HOME/cargo"
export RUSTUP_HOME="$XDG_DATA_HOME/rustup"

# Node.js
export NPM_HOME="$XDG_CONFIG_HOME/npm"
export NPM_CONFIG_USERCONFIG="$NPM_HOME/npmrc"

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
