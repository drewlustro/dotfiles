# exports.sh

# ----------------------------------------
# Platform-Agnostic
# ----------------------------------------
export GIT_EDITOR=vim
export VISUAL=vim
export EDITOR=vim

# Larger bash history (allow 32³ entries; default is 500)
export HISTSIZE=32768
export HISTFILESIZE=$HISTSIZE
export HISTCONTROL=ignoredups

# Prefer US English and use UTF-8
export LC_ALL="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"

# Highlight section titles in manual pages
export LESS_TERMCAP_md="$ORANGE"

# Don’t clear the screen after quitting a manual page
export MANPAGER="less -X"

# Prefer native architecture when building
export ARCHFLAGS="-arch $(uname -m)";

# Node default environment
export NODE_ENV=development

# Enable persistent REPL history for `node`.
export NODE_REPL_HISTORY=~/.node_history;
# Allow 32³ entries; the default is 1000.
export NODE_REPL_HISTORY_SIZE='32768';
# Use sloppy mode by default, matching web browsers.
export NODE_REPL_MODE='sloppy';

# Make Python use UTF-8 encoding for output to stdin, stdout, and stderr.
export PYTHONIOENCODING='UTF-8';


# Python 3 or 2 for PYTHONPATH
if [ -x "$(which python3)" ]; then

  : # no-op

  # PYTHONPATH -> homebrew Python 3 location
  # export PYTHONPATH="/usr/local/lib/python3.6/site-packages:$PYTHONPATH";
  # export PYTHON3PATH=$PYTHONPATH;

  # alias python2="$(which python)"; # set python2 -> system python
  # alias python="$(which python3)"; # set python -> python3
  # alias pip2="$(which pip)"; # set pip2 -> system pip
  # alias pip="$(which pip3)"; # set pip -> pip3
else

  # Python2 path w/ homebrew support
  if test $(which brew); then
    export PYTHON2PATH="$(brew --prefix)/lib/python2.7/site-packages:/Library/Python/2.7/site-packages:$HOME/Library/Python/2.7/lib/python/site-packages:$PYTHONPATH";
    export PYTHONPATH=$PYTHON2PATH;
  fi;

fi;

# Avoid issues with `gpg` as installed via Homebrew.
# https://stackoverflow.com/a/42265848/96656
export GPG_TTY=$(tty);

# ----------------------------------------
# Mac OS X
# ----------------------------------------
if [ "$PLATFORM" = "osx" ]; then
    # Link Homebrew casks in `/Applications` rather than `~/Applications`
    export HOMEBREW_CASK_OPTS="--appdir=/Applications";
    export PKG_CONFIG_PATH=/usr/local/lib/pkgconfig:/usr/local/lib;

    # Always enable colored `grep` output
    export GREP_OPTIONS="--color=auto"

    # ----------------------------------------
    # NODE x NVM (node version manager)
    # ----------------------------------------

    if $(type nvm &>/dev/null); then
      # IMPORTANT NOTE: brew-managed nvm + zprezto automatically
      # handles below loading if 'node' plugin is used.

      # `nvm` managed node
      # mkdir -p "$HOME/.nvm" 2>/dev/null;
      # export NVM_DIR="$HOME/.nvm";
      # source "/usr/local/opt/nvm/nvm.sh";
      # export NODE_PATH="$(npm root -g):$NODE_PATH:$NPM_PACKAGES/lib/node_modules";

      ### To fix nvm prefix warning:
      # npm config delete prefix
      # npm config set prefix $NVM_DIR/versions/node/v10.18.1
      :
      ####
    else
      # global default `node` + `npm`
      export NPM_PACKAGES="/usr/local";
      export PATH="$NPM_PACKAGES/bin:$PATH"
      export NODE_PATH="$(npm root -g):$NODE_PATH:$NPM_PACKAGES/lib/node_modules";
    fi

    # VSCode as default editor
    if [ -x "$(which code)" ]; then
        export VISUAL="code";
        export EDITOR=vim;
    fi;

    # ----------------------------------------
    # NODE x NVM (node version manager)
    # ----------------------------------------

    # if $(type nvm &>/dev/null); then
    #   # `nvm` managed node (manual install of nvm)
    #   mkdir -p "$HOME/.nvm" 2>/dev/null;
    #   export NVM_DIR="$HOME/.nvm";
    #   [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm (manual install) [AL compat?]
    #   export NODE_PATH="$(npm root -g):$NODE_PATH:$NPM_PACKAGES/lib/node_modules";

    #   # add bash completion
    #   if [[ "$SHELL_CHECK" == *bash ]]; then
    #     [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
    #   fi;
    # else
    #   # global default `node` + `npm`
    #   export NPM_PACKAGES="/usr/local";
    #   export PATH="$NPM_PACKAGES/bin:$PATH"
    #   export NODE_PATH="$(npm root -g):$NODE_PATH:$NPM_PACKAGES/lib/node_modules";
    # fi

fi;


# ----------------------------------------
# Linux Exports
# ----------------------------------------
if [ "$PLATFORM" = "linux" ]; then

    # NODE SETUP
    export NPM_PACKAGES="${HOME}/.npm-packages";
    export PATH="$NPM_PACKAGES/bin:$PATH";

    # Unset manpath so we can inherit from /etc/manpath via the `manpath` command
    unset MANPATH
    export MANPATH="$NPM_PACKAGES/share/man:$(manpath)";
    export NODE_PATH="$(npm root -g):$NODE_PATH:$HOME/.npm-packages/lib/node_modules";

    # NVM SETUP
    mkdir -p "$HOME/.nvm" 2>/dev/null;
    export NVM_DIR="$HOME/.nvm";
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh";

    [ "$ORIGINAL_SHELL" == "bash" ] && \
      [ -s "$NVM_DIR/bash_completion" ] && \
      \. "$NVM_DIR/bash_completion"

fi;






