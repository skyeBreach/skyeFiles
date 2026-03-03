#
#
#
# ================================================================================================ #
# Fast Node Manager

FNM_PATH="$XDG_DATA_HOME/fnm"

if [ -d "$FNM_PATH" ]; then
    export PATH="$FNM_PATH:$PATH"
    eval "$(fnm env)"
    eval "$(fnm completions)"
fi

# ================================================================================================ #
# Node Package Manager

NPM_HOME="$XDG_CONFIG_HOME/npm"
NPM_CONFIG_USERCONFIG="$NPM_HOME/npmrc"

eval "$(npm completion)"

# ================================================================================================ #
# PNPM

PNPM_HOME="$XDG_DATA_HOME/pnpm"
PATH="$PNPM_HOME:$PATH"

eval "$(pnpm completion zsh)"

# ================================================================================================ #

