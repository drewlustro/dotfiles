# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh
export SHELL=$(which zsh);

DISABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"

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

# Base default plugins and theme on platform
if [ "$PLATFORM" = "osx" ]; then
	ZSH_THEME="lazyprodigy";
	plugins=(colored-man bower brew git gem node npm pip python osx themes virtualenv zsh-syntax-highlighting);
else
	ZSH_THEME="lazyprodigy-server";
	plugins=(git gem node npm pip python zsh-syntax-highlighting);
fi;

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
