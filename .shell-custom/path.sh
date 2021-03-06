# Sample ~/.shell-custom/path.sh file
# ----------------------------------------
# Add custom additions to $PATH here.
# See auto-included $PATH additions in ~/.shell/path.sh
# ----------------------------------------
#
#
#
# Example (from ~/.shell/path.sh)
#
# Prepend GNU Coreutils path and manpath to existing $PATH/$MANPATH:
# if [ -x "$(which brew)" ] && [ -d "$(brew --prefix coreutils)/libexec/gnubin" ]; then
#     # Add GNU coreutils path/man (installed with 'brew install coreutils')
#     COREUTILS_BIN="$(brew --prefix coreutils)/libexec/gnubin";
#     COREUTILS_MAN="$(brew --prefix coreutils)/libexec/gnuman";
#     [ -d $COREUTILS_BIN ] && export PATH="$COREUTILS_BIN:$PATH";
#     [ -d $COREUTILS_MAN ] && export MANPATH="$COREUTILS_MAN:$MANPATH";
# fi;
