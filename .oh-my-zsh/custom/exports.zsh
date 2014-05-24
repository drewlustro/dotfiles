export GIT_EDITOR=vim
export VISUAL=atom
export EDITOR=atom

export WORKON_HOME=/sites/envs
export TM_PYCHECKER=pylint
export JAVA_HOME=/System/Library/Frameworks/JavaVM.framework/Home/
export PKG_CONFIG_PATH=/usr/local/lib/pkgconfig:/usr/local/lib

# PATH export additions for macports
export PATH=$PATH:/opt/local/bin:/opt/local/sbin:/opt/local/bin
export PATH=$PATH:/opt/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin
export PATH=$PATH:/usr/local/git/bin:/usr/X11/bin

# Larger bash history (allow 32³ entries; default is 500)
export HISTSIZE=32768
export HISTFILESIZE=$HISTSIZE
export HISTCONTROL=ignoredups

# Make some commands not show up in history
export HISTIGNORE="ls:cd:cd -:pwd:exit:date:* --help"

# Prefer US English and use UTF-8
export LANG="en_US"
export LC_ALL="en_US.UTF-8"

# Highlight section titles in manual pages
export LESS_TERMCAP_md="$ORANGE"

# Don’t clear the screen after quitting a manual page
export MANPAGER="less -X"

# Always enable colored `grep` output
export GREP_OPTIONS="--color=auto"

# Export-dependent aliases
alias zshconfig="$EDITOR ~/.zshrc ~/.oh-my-zsh"
