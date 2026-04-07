# ==================================================================================================================== #
# Install Paths

export BUN_INSTALL="$XDG_DATA_HOME/bun"
export BUN_INSTALL_CACHE_DIR="$XDG_DATA_HOME/bun/install"

PATH="$BUN_INSTALL/bin:$PATH"

[ -s "$BUN_INSTALL/_bun" ] && source "$BUN_INSTALL/_bun"

# ==================================================================================================================== #
