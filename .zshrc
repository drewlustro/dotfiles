# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh
export SHELL=$(which zsh);

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

# Load the shell-agnostic dotfiles, if they exist:
HOME_AG="$HOME/.shell";
if [ -d "$HOME_AG" ]; then
	AGNOSTIC_SHELL_FILES=( "$HOME_AG/init.sh" "$HOME_AG/path.sh" "$HOME_AG/exports.sh" "$HOME_AG/aliases.sh" "$HOME_AG/functions.sh" "$HOME_AG/extra.sh" )
	for file in $AGNOSTIC_SHELL_FILES; do
		[ -r "$file" ] && [ -f "$file" ] && source "$file";
	done;
	unset file;
fi;
unset HOME_AG;

# ZSH config files outside of version control
# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
CUSTOM_FILES=( "$HOME/.path" "$HOME/.exports" "$HOME/.aliases" "$HOME/.functions" "$HOME/.extra" );
for file in $CUSTOM_FILES; do
	[ -r "${file}" ] && [ -f "${file}" ] && source "${file}";
done
unset file;

source $ZSH/oh-my-zsh.sh
