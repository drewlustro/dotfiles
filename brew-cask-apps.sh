#!/bin/bash
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
        appcleaner
        atom
        audacity
        caffeine
        cloud
        colorpicker-developer
        colorpicker-hex
        dash
        divvy
        dropbox
        flux
        github
        google-chrome
        google-chrome-canary
        google-drive
        handbrake
        handbrakecli
        imagealpha
        imageoptim
        iterm2
        karabiner
        mactracker
        opera-next
        quicklook-json
        sequel-pro
        skype
        slack
        spotify
        sublime-text
        the-unarchiver
        torbrowser
        transmission
        virtualbox
        vlc
        xact
);

echo "Installing apps.."
for app in ${APPS[@]}; do
    brew cask install $app
done;

brew cask alfred link
brew cask cleanup
brew cask list
echo ""
echo "Done installing cask apps."
