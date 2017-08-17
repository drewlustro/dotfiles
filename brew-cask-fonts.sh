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
    font-clear-sans
    font-coda
    font-consolas-for-powerline
    font-droid-sans
    font-droid-sans-mono
    font-droid-serif
    font-fontawesome
    font-inconsolata
    font-inconsolata-for-powerline
    font-input
    font-input
    font-m-plus
    font-menlo-for-powerline
    font-noto-mono
    font-noto-sans
    font-noto-sans
    font-noto-serif
    font-noto-serif
    font-roboto
    font-roboto-mono
    font-roboto-mono-for-powerline
    font-source-code-pro
    font-source-code-pro-for-powerline
    font-source-sans-pro
    font-source-serif-pro
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
