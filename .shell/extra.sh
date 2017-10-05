# extra.sh

# virtualenvwrapper support
VEWPATH=$(which virtualenvwrapper.sh);
[ -f "$VEWPATH" ] && [ -x "$VEWPATH" ] && source "$VEWPATH";
unset VEWPATH;

# Rust environment support
[ -d "$HOME/.cargo" ] && source $HOME/.cargo/env;
[ -d "$HOME/.dir_colors" ] && eval `dircolors ~/.dir_colors/dircolors`;
