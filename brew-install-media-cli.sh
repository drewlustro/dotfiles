#!/usr/bin/env bash
# Uses Homebrew to install common CLI apps for hackers

# Check for Homebrew,
# Install if we don't have it
if test ! $(which brew); then
  echo "Installing homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Make sure we’re using the latest Homebrew
brew update

# Upgrade any already-installed formulae
brew upgrade

echo "Installing heavy multimedia libs and CLI apps (x264, flac, sox, etc)."
echo "This may take a while..."
echo ""

# Dependency libs
brew install cmake
brew install zlib
brew install libpng
brew install libtool
brew install libogg
brew install libvorbis
brew install freetype
brew install libyaml
brew install jpeg

# Multimedia
brew install x264
brew install x265
brew install flac
brew install ffmpeg --with-freetype --with-theora --with-tools --with-libvorbis --with-x265
brew install webkit2png
brew install ufraw --with-exiv2 # RAW image support for imagemagick
brew install imagemagick --with-webp
brew install sox # audio transcoding swiss-army knife


# Remove outdated versions from the cellar
brew cleanup

echo ""
echo "Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `\$PATH`."
echo ""
echo "Done installing common CLI apps and libs."
