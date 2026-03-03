#
# $ZDOTDIR/.zshrc
#
# ================================================================================================ #
# Starship

eval "$(starship init zsh)"

# ================================================================================================ #
# Antidote


# Set the root name of the plugins files (.txt and .zsh) antidote will use.
zsh_plugins=${ZDOTDIR:-~}/.zsh_plugins

# Ensure the .zsh_plugins.txt file exists so you can add plugins.
[[ -f ${zsh_plugins}.txt ]] || touch ${zsh_plugins}.txt

# Lazy-load antidote from its functions directory.
fpath=($ZDOTDIR/.antidote/functions $fpath)
autoload -Uz antidote

# Generate a new static file whenever .zsh_plugins.txt is updated.
if [[ ! ${zsh_plugins}.zsh -nt ${zsh_plugins}.txt ]]; then
  antidote bundle <${zsh_plugins}.txt >|${zsh_plugins}.zsh
fi

# Source your static plugins file.
source ${zsh_plugins}.zsh

export HISTORY_SUBSTRING_SEARCH_PREFIXED=1

# ================================================================================================ #
# Transient Prompt

#source $ZDOTDIR/theme/transient-prompt.zsh-theme
TRANSIENT_PROMPT_TRANSIENT_PROMPT='$(starship module character)'

# ================================================================================================ #
# FNM

FNM_PATH="$XDG_DATA_HOME/fnm"

if [ -d "$FNM_PATH" ]; then
    export PATH="$FNM_PATH:$PATH"
    eval "$(fnm env)"
    eval "$(fnm completions)"
fi

# ================================================================================================ #
# Node

NPM_HOME="$XDG_CONFIG_HOME/npm"
NPM_CONFIG_USERCONFIG="$NPM_HOME/npmrc"

eval "$(npm completion)"

# ================================================================================================ #
# PNPM

PNPM_HOME="$XDG_DATA_HOME/pnpm"
PATH="$PNPM_HOME:$PATH"

eval "$(pnpm completion zsh)"

# ================================================================================================ #
# Bun

export BUN_INSTALL="$XDG_DATA_HOME/bun"
export BUN_INSTALL_CACHE_DIR="$XDG_DATA_HOME/bun/install"

PATH="$BUN_INSTALL/bin:$PATH"

[ -s "$BUN_INSTALL/_bun" ] && source "$BUN_INSTALL/_bun"



# ================================================================================================ #
# Zoxide

_ZO_DATA_DIR="$XDG_STATE_HOME/zoxide"

eval "$(zoxide init zsh)"

alias cd='z'

# ================================================================================================ #
# Rust

CARGO_HOME="$XDG_DATA_HOME/cargo"
RUSTUP_HOME="$XDG_DATA_HOME/rustup"

[ -s "$CARGO_HOME" ] && source "$CARGO_HOME/env"

# ================================================================================================ #
# Maven

export MAVEN_ARGS="--global-settings $XDG_CONFIG_HOME/m2/settings.xml"

# ================================================================================================ #
# LSDeluxe

alias lsd="lsd -F --group-directories-first --sort git"

alias ls="lsd"
alias ld="lsd -d"
alias la="lsd -a"
alias ll="lsd -l"
alias lla="lsd -la"
alias lt="lsd --tree --depth 2"

# ================================================================================================ #
# Lua

export LUAROCKS_CONFIG="$XDG_CONFIG_HOME/luarocks/config-5.1.lua"

# ================================================================================================ #
# Just

eval "$(just --completions zsh)"


# ================================================================================================ #
# Bun

[ -s "/home/skye/.local/share/bun/_bun" ] && source "/home/skye/.local/share/bun/_bun"

# ================================================================================================ #
# Python

# UV
eval "$(uv generate-shell-completion zsh)"
eval "$(uvx --generate-shell-completion zsh)"

# Ruff
eval "$(ruff generate-shell-completion zsh)"

# ================================================================================================ #
