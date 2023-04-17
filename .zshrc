# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...
# Path to your oh-my-zsh configuration.
export SHELL=$(which zsh);

# Homebrew - add to path
eval "$(/opt/homebrew/bin/brew shellenv)"

DISABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"
# unsetopt auto_name_dirs # fixes RVM_PROJECT_PATH~ artifact in zprezto prompt

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
unsetopt correct
unsetopt correct_all
# unsetopt auto_name_dirs # fixes RVM_PROJECT_PATH~ artifact in zprezto prompt

# prezto themes
alias prompt-remote-ssh='prompt sorin'
alias prompt-alternative='prompt nicoulaj'

# remote SSH session detection
if [ ! -z "$SSH_TTY" ]; then
  echo "Remote login detected.";
  prompt-remote-ssh;
fi

# pyenv
if which pyenv &> /dev/null; then
  eval "$(pyenv init -)"
fi

# rbenv
if which rbenv &> /dev/null; then
  eval "$(rbenv init -)";
fi


# zoxide - zsh
eval "$(zoxide init zsh)"

# prevent homebrew from auto-upgrading dependencies
export HOMEBREW_NO_INSTALLED_DEPENDENTS_CHECK=true
