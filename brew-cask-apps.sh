#!/usr/bin/env bash
# Uses Homebrew's Cask feature to quickly install apps on a new machine

# Check for Homebrew,
# Install if we don't have it
if test ! $(which brew); then
  echo "Installing homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# use main /Applications folder. Default is $HOME/Applications
APP_INSTALL_DIR="/Applications"
export HOMEBREW_CASK_OPTS="--appdir=/Applications"

brew install caskroom/cask/brew-cask
brew tap caskroom/versions

APPS=(
        alfred
        atom
        audacity
        cloudapp
        colorpicker-developer
        colorpicker-hex
        dash
        divvy
        dropbox
        github-desktop
        google-chrome
        google-chrome-canary
        handbrake
        handbrakebatch
        imagealpha
        imageoptim
        iterm2
        karabiner-elements
        mactracker
        postico
        quicklook-json
        quicklook-csv
        sequel-pro
        skype
        slack
        spotify
        swinsian
        sublime-text
        the-unarchiver
        torbrowser
        transmission
        virtualbox
        vlc
        xact
        xld
);

echo "Installing apps.."
for app in ${APPS[@]}; do
    echo "Installing '$app'..."
    brew cask install --appdir="/Applications" $app
done;

brew cask alfred link
brew cask cleanup
echo ""
echo "Installed applications via brew-cask:"
brew cask list
echo ""
echo "Done installing brew cask apps."
