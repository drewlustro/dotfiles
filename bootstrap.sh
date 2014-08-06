#!/usr/bin/env bash
# Drew's Dotfiles
# Sensible defaults that work great for both Bash and ZSH!
# https://github.com/drewlustro/dotfiles
# License: MIT

DOTFILES_URL="https://github.com/drewlustro/dotfiles"
DOTFILES_VERSION="1.1";
DOTFILES_UPDATED="August 6, 2014"
cd "$(dirname "${BASH_SOURCE}")";


function hr() {
	echo "------------------------------------------------------------";
}

function br() {
	echo "";
}

function sayDone() {
	echo "- Done";
	hr; br;
}

function doIt() {

	echo "+ Rsync'ing essential config files to home directory..."
	br;
	rsync --exclude ".git/" --exclude ".DS_Store" --exclude "bootstrap.sh" \
		--exclude "bootstrap.zsh" --exclude "iterm2/" --exclude ".zshrc" \
		--exclude "Brewfile" --exclude "Caskfile" --exclude ".osx" \
		--exclude "*.sample" --exclude ".gitignore" \
		--exclude "README.md" --exclude "LICENSE-MIT.txt" \
		--exclude "init/" --exclude "sublimetext" -avh --no-perms . ~;
	sayDone;

	echo "+ Installing starter no-fork files if necessary..."
	br;
	local overwrite_lock=0;
	for file in ~/.{path,aliases,exports,extra,functions}; do
		local basename=${file##*.};
		local overwrite=0;
		if [ -r "$file" ] && [ -f "$file" ]; then
			if [ $overwrite_lock = 0 ]; then
				echo "Detected existing $file file, would you like to overwrite it with $basename.sample?";
				echo "[y] = Yes, overwrite existing file.";
				echo "[n] = No, do not overwrite.";
				echo "[o] = Overwrite all with sample files";
				read -p "Answer: " -n 1;

				if [[ $REPLY =~ ^[Yy]$ ]]; then
					overwrite=1;
				elif [[ $REPLY =~ ^[Oo]$ ]]; then
					echo "Overwrite all."
					br;
					overwrite=1;
					overwrite_lock=1;
				else
					echo "Not overwriting."
					br;
					overwrite=0;
				fi;
			else
				overwrite=1;
			fi;

			if [ $overwrite = 1 ]; then
				overwrite=0;
				echo "Overwrite $basename.sample to ~/.$basename"
				cp ./.$basename.sample ~/.$basename
				br;
			fi;

		else
			echo "Installing $basename.sample to ~/.$basename"
			cp ./.$basename.sample ~/.$basename
			br;
		fi;
	done;
	unset file;
	sayDone;

	source ~/.bash_profile;
}

hr;
echo "WELCOME TO DREW'S DOTFILES, SON!"
hr;
echo "+ Version: $DOTFILES_VERSION"
echo "+ Updated: $DOTFILES_UPDATED"
echo "+ Support available at $DOTFILES_URL"
hr;
br;
echo "+ Updating dotfiles from origin/master...";
br;
git pull origin master;
sayDone;

if [ "$1" == "--force" -o "$1" == "-f" ]; then
	doIt;
else
	read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1;
	br;
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		doIt;
	fi;
fi;

unset doIt;
unset hr;
unset br;
unset sayDone;
