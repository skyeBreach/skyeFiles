#
# $ZDOTDIR/.zshenv
#
# ================================================================================================ # 
# Path Definition

# Include the users private bin
PATH=$HOME/bin:$PATH
PATH=$HOME/.local/bin:$PATH

#Export once modification is complete1
PATH=$PATH

# ================================================================================================ #
# XDG Base Directory

XDG_CONFIG_HOME=$HOME/.config
XDG_CACHE_HOME=$HOME/.cache
XDG_DATA_HOME=$HOME/.local/share
XDG_STATE_HOME=$HOME/.local/state

# ================================================================================================ #
# Default Applications

TERMINAL=wezterm
EDITOR=nvim
PAGER=less
THEME=catppuccin-macchiato

# ================================================================================================ #

