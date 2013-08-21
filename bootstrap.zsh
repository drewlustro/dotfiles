#!/usr/bin/env zsh
git pull origin master
function doIt() {
    if [[ -z "$ZSH" ]]; then
        echo "ZSH is not set, aborting. (it is usually ~/.oh-my-zsh)"
    else
        echo "OK going for it"
        mkdir "$ZSH/custom" > /dev/null 2>&1
        rsync -av --no-perms .zshrc ~
        rsync -av --no-perms bin ~
        rsync -av --no-perms --exclude ".DS_Store" --exclude "extra.zsh" ./zsh/custom/* "$ZSH/custom/"
    fi
}
if [[ "$1" == "--force" || "$1" == "-f" ]]; then
    doIt
else
    echo "ZSH dotfiles installation:"
    read "REPLY?This may overwrite existing files in your home directory and zsh config directories. Are you sure? (y/n) " -k 1
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        echo "Installing..."
        doIt
    else
        echo "Aborted installation."
    fi
fi
unset doIt
source ~/.zshrc
