#!/usr/bin/env bash
# Drew's Dotfiles
# Sensible defaults that work great for both Bash and ZSH!
# https://github.com/drewlustro/dotfiles
# License: MIT

DOTFILES_URL="https://github.com/drewlustro/dotfiles"
DOTFILES_VERSION="1.4";
DOTFILES_UPDATED="November 12, 2014 – 6:00a EST"
cd "$(dirname "${BASH_SOURCE}")";

function hr() {
    echo "------------------------------------------------------------";
}

function br() {
    echo "";
}

function sayDone() {
    echo "- Done bootstrapping!";
    echo "- If you would like to install tons of convenient extras, run the following:"
    echo "------------------------"
    echo "$ ./brew-cask-fonts.sh  # installs a handful of useful public-domain typefaces, including many coding fonts"
    echo "$ ./brew-install-cli.sh # installs TONS of useful binaries, libs, and CLI tools via brew"
    echo "$ ./brew-cask-apps.sh   # installs many useful OS X applications via brew-cask"
    echo "------------------------"
    echo "- See each shell file above to see which components will be (non-destructively) installed."
    echo "- Hope you enjoy! –Drew"
    echo "------------------------"
    br; hr;
}

function installInputFont() {
    echo "+ Rsync'ing essential config files to /Library/Fonts directory..."
    br;
    rsync -avh --no-perms Library/Fonts/*.ttf /Library/Fonts/;
    hr;
    br;
    echo "+ Installed Input Font into /Library/Fonts "
    echo "+ Please LOGOUT and LOGIN to see changes."
    echo "- Remove .tff files from /Libary/Fonts/InputSystem* to uninstall."
    br;
    hr;

}

function doIt() {

    echo "+ Rsync'ing essential config files to home directory..."
    br;
    rsync --exclude ".git/" \
        --exclude ".DS_Store" \
        --exclude "bootstrap.sh" \
        --exclude "bootstrap.zsh" \
        --exclude "brew-cask-apps.sh" \
        --exclude "brew-install-cli.sh" \
        --exclude "brew-install-media-cli.sh" \
        --exclude "brew-cask-fonts.sh" \
        --exclude ".osx" \
        --exclude ".xmodmaprc*" \
        --exclude "iterm2/" \
        --exclude "Library/" \
        --exclude "linux/" \
        --exclude "Xcode/" \
        --exclude "sublimetext/" \
        --exclude "*.sample" --exclude ".gitignore" \
        --exclude "README.md" --exclude "LICENSE-MIT.txt" \
        --exclude "bin/" \
        --exclude "init/" -avh --no-perms . ~;
    sayDone;

    # make local npm packages dir to allow non-sudo global npm packages
    mkdir "$HOME/.npm-packages" 2> /dev/null;

    if ls --color > /dev/null 2>&1; then # GNU coreutils `ls`
        echo "[Notice] Detected GNU ls, not copying ./bin";
    else
        echo "[Notice] Detected OS X, installing GNU utils into ~/bin";
        mkdir "~/bin" > /dev/null 2>&1;
        cp -pr ./bin ~/;
        chmod a+x ~/bin/*;
    fi;

    hr;
    echo "+ [DEPRECATED] Installing starter no-fork files if necessary..."
    br;
    sayDone;

    source ~/.bash_profile;
}

hr;
echo "WELCOME TO DREW'S DOTFILES for Bash & ZSH, SON!"
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

if [ "$1" = "--force" ] || [ "$1" = "-f" ]; then
    doIt;
else
    hr;
    echo "WARNING: This may overwrite existing Bash & ZSH dotfiles in your home directory.";
    echo "Including: .zshrc,  .bashrc, .bash_profile, .bash_prompt & more.";
    echo "Default aliases, exports, functions, and path additions will be added to $HOME/.shell";
    echo "Customizable, empty versions of above will be added to $HOME if you choose.";
    hr;

    if [[ "$SHELL" == *zsh ]]; then
        echo "Shell is: $SHELL";
        echo "Please run this install script from bash.";
    elif [[ "$SHELL" == *bash ]]; then
        read -p "Are you sure you would like to proceed? (y/N) " -n 1;
        br;
        if [[ $REPLY =~ ^[Yy]$ ]]; then
            doIt;
        fi;
    fi;
fi;

if [[ "$SHELL" == *zsh ]]; then
    echo "Shell is: $SHELL";
    echo "Please run this install script from bash.";
elif [[ "$SHELL" == *bash ]]; then
    hr;
    echo "Extra: Input system typeface replacement.";
    echo "You can (non-desctructively) replace the OS X system font with Input, a typeface from Font Bureau.";
    echo "It's license file is included in the git repository.";
    echo "More Info: http://input.fontbureau.com/systemfont/"
    hr;
    read -p "Would you like to install Input? (y/N) " -n 1;
    br;
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        installInputFont;
    else
        echo "Skipping Input system font install.";
    fi;
fi;

hr;
br;
br;
br;
br;

echo "          Later!"

br;
br;
br;
br;
hr;

unset doIt;
unset hr;
unset br;
unset sayDone;
unset installInputFont;
