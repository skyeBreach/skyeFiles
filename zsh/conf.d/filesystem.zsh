# ================================================================================================ #
# Zoxide

_ZO_DATA_DIR="$XDG_STATE_HOME/zoxide"

eval "$(zoxide init zsh)"

alias cd='z'

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

