# path.sh

if [ "$PLATFORM" = "osx" ]; then
    # Prepend GNU Coreutils path and manpath to existing $PATH/$MANPATH
    if [ -x "$(which brew)" ] && [ -d "$(brew --prefix coreutils)/libexec/gnubin" ]; then
        # Add GNU coreutils path/man (installed with 'brew install coreutils')
        COREUTILS_BIN="$(brew --prefix coreutils)/libexec/gnubin";
        COREUTILS_MAN="$(brew --prefix coreutils)/libexec/gnuman";
        [ -d $COREUTILS_BIN ] && export PATH="$COREUTILS_BIN:$PATH";
        [ -d $COREUTILS_MAN ] && export MANPATH="$COREUTILS_MAN:$MANPATH";
    fi;

    # If Calibre is installed, provide CLI tools for converting books
    if [ -d "/Applications/calibre.app/Contents/console.app/Contents/MacOS" ]; then
      export PATH="$PATH:/Applications/calibre.app/Contents/console.app/Contents/MacOS";
    fi;

    # support homebrew-installed python3
    [ -d "/usr/local/opt/python/libexec/bin" ] && export PATH="/usr/local/opt/python/libexec/bin:$PATH";
fi;

# setup PATH to check $HOME/bin first, (then /usr/local/bin, /usr/bin ... etc)
[ -d "$HOME/bin" ] && export PATH="$HOME/bin:$PATH";

[ -d "$HOME/.local/bin" ] && export PATH="$HOME/.local/bin:$PATH";

# Load RVM scripts if RVM is installed
if [ -s "$HOME/.rvm/scripts/rvm" ]; then
    source "$HOME/.rvm/scripts/rvm";  # This loads RVM into a shell session.
    [ -d "$HOME/.rvm/bin" ] && export PATH="$PATH:$HOME/.rvm/bin"; # Add RVM to PATH for scripting
fi;
