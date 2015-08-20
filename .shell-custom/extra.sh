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
# Use SublimeText 3 as default Git editor
# git config --global core.editor "subl -n -w"
#
# Auto-set python work environment
# DEFAULT_PYTHON_ENV="default";
# DEFAULT_WORKON_HOME="/sites/envs";
# [ -d "$DEFAULT_WORKON_HOME" ] && export WORKON_HOME="/sites/envs";
# [ -x "$(which virtualenvwrapper.sh)" ] && source "$(which virtualenvwrapper.sh)";
# [ -d "$DEFAULT_WORKON_HOME/$DEFAULT_PYTHON_ENV" ] && workon $DEFAULT_PYTHON_ENV;
#
# Autojump support "j" command from autojump binary installed via `brew install autojump`
# [[ -s `brew --prefix`/etc/autojump.sh ]] && . `brew --prefix`/etc/autojump.sh
