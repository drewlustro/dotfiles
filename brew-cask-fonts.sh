#!/bin/bash
# Uses Homebrew's Cask feature to quickly install open source fonts on a new machine

# Check for Homebrew,
# Install if we don't have it
if test ! $(which brew); then
  echo "Installing homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

brew tap caskroom/fonts

FONTS=(
    font-m-plus
    font-clear-sans
    font-roboto
    font-droid-sans
    font-droid-sans-mono
    font-droid-serif
    font-inconsolata
    font-input
    font-coda
    font-fontawesome
    font-source-code-pro
    font-source-sans-pro
    font-source-serif-pro
    font-noto-sans
    font-noto-serif
)

echo "Installing fonts..."
for font in ${FONTS[@]}; do
    echo "Installing typeface '$font'..."
    brew cask install $font
done;

brew cask cleanup
brew cask list
echo ""
echo "Done installing fonts."
