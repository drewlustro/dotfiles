# Sample ~/.shell-custom/extra.sh file
# ----------------------------------------
# Put customized extras in here.
# See auto-included extras in ~/.shell/extra.sh
# ----------------------------------------
#
# Examples:
# Git credentials
#
# Not in the repository, to prevent people from accidentally committing under my name
# export GIT_AUTHOR_NAME="Your Name"
# export GIT_COMMITTER_NAME="$GIT_AUTHOR_NAME"
# git config --global user.name "$GIT_AUTHOR_NAME"
#
# export GIT_AUTHOR_EMAIL="your@email.com"
# export GIT_COMMITTER_EMAIL="$GIT_AUTHOR_EMAIL"
# git config --global user.email "$GIT_AUTHOR_EMAIL"
#
# git config --global core.editor "vim"
#
# Prefer gpg2, if available
# [ -x "$(which gpg2)" ] && git config --global gpg.program gpg2

# Auto-set python work environment
# DEFAULT_PYTHON_ENV="default";
# DEFAULT_WORKON_HOME="/sites/envs";
# [ -d "$DEFAULT_WORKON_HOME" ] && export WORKON_HOME="/sites/envs";
# [ -x "$(which virtualenvwrapper.sh)" ] && source "$(which virtualenvwrapper.sh)";
# [ -d "$DEFAULT_WORKON_HOME/$DEFAULT_PYTHON_ENV" ] && workon $DEFAULT_PYTHON_ENV;
#
# Autojump support "j" command from autojump binary installed via `brew install autojump`
# [[ -s `brew --prefix`/etc/autojump.sh ]] && . `brew --prefix`/etc/autojump.sh
#
# beets autocompletion
# BEETS_AUTOCOMPLETE="$INCLUDES_CUSTOM/autocompletion/beets.sh"
# [ -r "$BEETS_AUTOCOMPLETE" ] && source "$BEETS_AUTOCOMPLETE";


# ----------------------------------------
# DELETE BELOW THIS LINE
# ----------------------------------------
# Drew's Credentials
# export GIT_AUTHOR_NAME="Drew Lustro"
# export GIT_COMMITTER_NAME="$GIT_AUTHOR_NAME"
# git config --global user.name "$GIT_AUTHOR_NAME"

# export GIT_AUTHOR_EMAIL="drewlustro@gmail.com"
# export GIT_COMMITTER_EMAIL="$GIT_AUTHOR_EMAIL"
# git config --global user.email "$GIT_AUTHOR_EMAIL"
#
# git config --global core.editor "vim"
#
#################################################3
# GPG key setup
#
# penthouse (Ubuntu 17.10)
# git config --global user.signingkey C4223BA627FE58C7
# git config --global commit.gpgsign true
#
# sweet-nightmare (Xenial 16.04 / KDE Neon 5.7)
## git config --global user.signingkey 64DDB211EE258F8C
# sage (macOS rMBP 2013)
## git config --global user.signingkey 65A3421DB46F0303
#
# Prefer gpg2, if available
# [ -x "$(which gpg2)" ] && git config --global gpg.program gpg2

###########################################################3
#
# # Auto-set python work environment
# DEFAULT_PYTHON_ENV="default";
# DEFAULT_WORKON_HOME="/sites/envs";
# [ -d "$DEFAULT_WORKON_HOME" ] && export WORKON_HOME="$DEFAULT_WORKON_HOME";
# [ -x "$(which virtualenvwrapper.sh)" ] && source "$(which virtualenvwrapper.sh)";
# [ -d "$DEFAULT_WORKON_HOME/$DEFAULT_PYTHON_ENV" ] && workon $DEFAULT_PYTHON_ENV;

# #
# # Autojump support "j" command from autojump binary installed via `brew install autojump`
# [[ -s `brew --prefix`/etc/autojump.sh ]] && . `brew --prefix`/etc/autojump.sh
#
# beets autocompletion
# BEETS_AUTOCOMPLETE="$INCLUDES_CUSTOM/autocompletion/beets.sh"
# [ -r "$BEETS_AUTOCOMPLETE" ] && source "$BEETS_AUTOCOMPLETE";

