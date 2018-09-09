# extra.sh

# virtualenvwrapper support
VEWPATH=$(which virtualenvwrapper.sh);
[ -f "$VEWPATH" ] && [ -x "$VEWPATH" ] && source "$VEWPATH";
unset VEWPATH;

# Rust environment support
[ -d "$HOME/.cargo" ] && source $HOME/.cargo/env;
[ -d "$HOME/.dir_colors" ] && eval `dircolors ~/.dir_colors/dircolors`;

if [ -x "$(which diff-so-fancy)" ]; then
  git config --global core.pager "diff-so-fancy | less --tabs=1,5 -RFX"
  git config --global color.ui true

  git config --global color.diff-highlight.oldNormal    "red bold"
  git config --global color.diff-highlight.oldHighlight "red bold 52"
  git config --global color.diff-highlight.newNormal    "green bold"
  git config --global color.diff-highlight.newHighlight "green bold 22"

  git config --global color.diff.meta       "yellow"
  git config --global color.diff.frag       "magenta bold"
  git config --global color.diff.commit     "yellow bold"
  git config --global color.diff.old        "red bold"
  git config --global color.diff.new        "green bold"
  git config --global color.diff.whitespace "red reverse"
fi;
