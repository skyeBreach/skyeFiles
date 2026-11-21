# ==================================================================================================================== #
# Profile - Login Environment
#
# Read by the display manager for the X session, and sourced by zsh's .zshenv, so both get the same environment.
# ==================================================================================================================== #
# Environment

set -a
for file in "$HOME"/.config/environment.d/*.conf; do
    [ -r "$file" ] && . "$file"
done
unset file
set +a

# ==================================================================================================================== #
