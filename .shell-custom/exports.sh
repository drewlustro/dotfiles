# Sample ~/.shell-custom/exports.sh
# ----------------------------------------
# Put customized exports in here.
# See auto-included exports in ~/.shell/exports.sh
# ----------------------------------------
#
# Example:
# export GIT_EDITOR=vim
# export VISUAL=atom
# export EDITOR=atom
# export HOMEBREW_CASK_OPTS="--appdir=/Applications"

export GIT_EDITOR=vim
export VISUAL=vim
export EDITOR=vim

export WORKON_HOME=/sites/envs
export PKG_CONFIG_PATH=/usr/local/lib/pkgconfig:/usr/local/lib

# Larger bash history (allow 32³ entries; default is 500)
export HISTSIZE=32768
export SAVEHIST=32768
export HISTFILESIZE=$HISTSIZE
export HISTCONTROL=ignoredups

# Make some commands not show up in history
export HISTIGNORE="ls:cd:cd -:pwd:exit:date:* --help"

if [[ "$SHELL" == *zsh ]]; then
    setopt BANG_HIST                 # Treat the '!' character specially during expansion.
    setopt EXTENDED_HISTORY          # Write the history file in the ':start:elapsed;command' format.
    setopt INC_APPEND_HISTORY        # Write to the history file immediately, not when the shell exits.
    setopt SHARE_HISTORY             # Share history between all sessions.
    setopt HIST_EXPIRE_DUPS_FIRST    # Expire a duplicate event first when trimming history.
    setopt HIST_IGNORE_DUPS          # Do not record an event that was just recorded again.
    setopt HIST_IGNORE_ALL_DUPS      # Delete an old recorded event if a new event is a duplicate.
    setopt HIST_FIND_NO_DUPS         # Do not display a previously found event.
    setopt HIST_IGNORE_SPACE         # Do not record an event starting with a space.
    setopt HIST_SAVE_NO_DUPS         # Do not write a duplicate event to the history file.
    setopt HIST_VERIFY               # Do not execute immediately upon history expansion.
    setopt HIST_BEEP                 # Beep when accessing non-existent history.
fi;

# Prefer US English and use UTF-8
export LANG="en_US"
export LC_ALL="en_US.UTF-8"

# Highlight section titles in manual pages
export LESS_TERMCAP_md="$ORANGE"

# Don’t clear the screen after quitting a manual page
export MANPAGER="less -X"

# Prefer 64-bit architecture when building
export ARCHFLAGS='-arch x86_64'

# Node default environment
export NODE_ENV=development

