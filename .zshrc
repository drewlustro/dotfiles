# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...
# Path to your oh-my-zsh configuration.
export SHELL=$(which zsh);

DISABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"

# ----------------------------------------
# STOCK DOTFILES (https://github.com/drewlustro/dotfiles)
# (do not change these. they're managed by git)
# ----------------------------------------
INCLUDES_DEFAULT="$HOME/.shell";
if [ -d "$INCLUDES_DEFAULT" ]; then
    AGNOSTIC_SHELL_FILES=( "$INCLUDES_DEFAULT/init.sh" "$INCLUDES_DEFAULT/path.sh" "$INCLUDES_DEFAULT/exports.sh" "$INCLUDES_DEFAULT/aliases.sh" "$INCLUDES_DEFAULT/functions.sh" "$INCLUDES_DEFAULT/extra.sh" );
    for file in ${AGNOSTIC_SHELL_FILES[@]}; do
        [ -r "$file" ] && [ -f "$file" ] && source "$file";
    done;
    unset file;
fi;
unset INCLUDES_DEFAULT;

# ----------------------------------------
# CUSTOM DOTFILES
# Load the userland custom shell dotfiles (freely customizable, never overwritten)
# Go ahead and change these if you want!
# ----------------------------------------
INCLUDES_CUSTOM="$HOME/.shell-custom";
if [ -d "$INCLUDES_CUSTOM" ]; then
    INCLUDES=( "$INCLUDES_CUSTOM/path.sh" "$INCLUDES_CUSTOM/exports.sh" "$INCLUDES_CUSTOM/aliases.sh" "$INCLUDES_CUSTOM/functions.sh" "$INCLUDES_CUSTOM/extra.sh" );
    for file in ${INCLUDES[@]}; do
        [ -r "$file" ] && [ -f "$file" ] && source "$file";
    done;
    unset file;
    unset INCLUDES;
fi;
unset INCLUDES_CUSTOM;

unsetopt auto_name_dirs
unsetopt correct
unsetopt correct_all
