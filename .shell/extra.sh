# extra.sh

# virtualenvwrapper support
VEWPATH=$(which virtualenvwrapper.sh);
[ -f "$VEWPATH" ] && [ -x "$VEWPATH" ] && source "$VEWPATH";
unset VEWPATH;
