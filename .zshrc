# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.

# Default theme that ships with oh-my-zsh
ZSH_THEME="robbyrussell"

# Drew's themes
#ZSH_THEME="lazyprodigy"
#ZSH_THEME="lazyprodigy-server"

DISABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"

# Drew's Plugins
plugins=(colored-man bower brew git gem node npm pip python osx themes virtualenv zsh-syntax-highlighting)
# plugins=()

# use 'default' virtualenv for python (environments live in /sites/envs)
# workon default

# setup PATH to check $HOME/bin first, (then /usr/local/bin, /usr/bin ... etc)
export PATH=$HOME/bin:$PATH

# Load RVM scripts if RVM is installed
if [[ -s "$HOME/.rvm/scripts/rvm" ]] then
    # echo "[Notice] Detected RVM and added ~/.rvm/bin to PATH"
    . "$HOME/.rvm/scripts/rvm"  # This loads RVM into a shell session.
    export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
fi

# ZSH config files outside of version control
# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
CUSTOM_FILES=($HOME/.path $HOME/.exports $HOME/.aliases $HOME/.functions $HOME/.extra)
for file in $CUSTOM_FILES; do
	[[ -r "${file}" ]] && [[ -f "${file}" ]] && source "${file}"
done

source $ZSH/oh-my-zsh.sh
