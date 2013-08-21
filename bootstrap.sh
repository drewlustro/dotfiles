#!/usr/bin/env bash
cd "$(dirname "${BASH_SOURCE}")"
git pull origin master
function doIt() {
	rsync --exclude ".git/" --exclude "zsh/" --exclude ".zshrc" --exclude ".DS_Store" --exclude "bootstrap.sh" --exclude "bootstrap.zsh" --exclude "README.md" -av --no-perms . ~
}
if [ "$1" == "--force" -o "$1" == "-f" ]; then
	doIt
else
    echo "BASH dotfiles installation:"
	read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1
	echo
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		doIt
	fi
fi
unset doIt
source ~/.bash_profile
