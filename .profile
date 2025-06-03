
# export PYENV_ROOT="$HOME/.pyenv"
# [[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
# eval "$(pyenv init -)"
set -m

export GPG_TTY=$(tty)

export RUBOCOP_DAEMON_USE_BUNDLER=true
export PATH="$HOME/.rbenv/shims:$PATH"

# export PATH="/usr/local/bin/rubocop-daemon-wrapper:$PATH"

. "$HOME/.local/bin/env"
. "$HOME/.cargo/env"
