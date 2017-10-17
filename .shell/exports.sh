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

    # NODE
    export NPM_PACKAGES="/usr/local";
    export PATH="$NPM_PACKAGES/bin:$PATH"
    export NODE_PATH="$NODE_PATH:$NPM_PACKAGES/lib/node_modules:$(npm root -g)";

    # ----------------------------------------
    # NVM (node version manager)
    # ----------------------------------------

    if $(type nvm &>/dev/null); then
      mkdir -p "$HOME/.nvm" 2>/dev/null;
      export NVM_DIR="$HOME/.nvm";
      source "/usr/local/opt/nvm/nvm.sh";
    fi

    if [ -x "$(which subl)" ]; then
        export VISUAL=subl;
        export EDITOR=vim;
    fi;
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






