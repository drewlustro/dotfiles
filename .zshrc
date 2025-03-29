# Source Prezto.
if [[ -o interactive ]]; then
  if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
    source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
  fi;
fi;

# Homebrew - add to path
eval "$(/opt/homebrew/bin/brew shellenv)"

# zsh options
export SHELL=$(which zsh);
export DISABLE_CORRECTION="true"
export COMPLETION_WAITING_DOTS="true"
unsetopt correct
unsetopt correct_all
unsetopt auto_name_dirs # fixes RVM_PROJECT_PATH~ artifact in zprezto prompt

# language managers -----------------------------------------------------------

# rbenv - must come before prezto
if which rbenv &> /dev/null; then
  eval "$(rbenv init -)";
fi

# node version manager
export NVM_DIR="${HOME}/.nvm";
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh";

# pyenv
if which pyenv &> /dev/null; then
  eval "$(pyenv init -)"
fi

# repo dotfiles ----------------------------------------------------------------
DIR="$HOME/.shell"
if [ -d "$DIR" ]; then
  for file in init path exports aliases functions extra; do
    [ -r "$DIR/$file.sh" ] && [ -f "$DIR/$file.sh" ] && source "$DIR/$file.sh"
  done
fi
unset DIR

# custom
DIR="$HOME/.shell-custom"
if [ -d "$DIR" ]; then
  for file in path exports aliases functions extra; do
    [ -r "$DIR/$file.sh" ] && [ -f "$DIR/$file.sh" ] && source "$DIR/$file.sh"
  done
fi
unset DIR

# env -------------------------------------------------------------------------
export DISABLE_SPRING=true
export DOCKER_BUILDKIT=1
export HOMEBREW_NO_INSTALLED_DEPENDENTS_CHECK=true
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=true
export PUPPETEER_EXECUTABLE_PATH=`which chromium`
export PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=true

# interacive?
if [[ $- == *i* ]]; then
  # zoxide - zsh
  eval "$(zoxide init zsh)"
fi;

# remote login prompt - visually obvious alternative
# if [ ! -z "$SSH_TTY" ]; then
#   echo "Remote login detected.";
#   prompt-remote-ssh;
# fi

# secrets
if [ -f "$HOME/.secrets.sh" ]; then
  source "$HOME/.secrets.sh"
else
  echo "Warning: ~/.secrets.sh is missing (maybe add it dawg?)"
fi

# everything else --------------------------------------------------------------

alias kprod='kubectx prod'
alias kstage='kubectx stage'
alias kbuild='kubectx build'
alias wellfound='cd ~/dev/wellfoundai'
alias wf='cd ~/devl/wellfoundai'

export PATH="/opt/homebrew/opt/libpq/bin:$PATH"

unalias sudo

. "$HOME/.local/bin/env"
