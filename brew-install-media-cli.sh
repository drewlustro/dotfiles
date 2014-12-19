#!/bin/bash
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
# Install GNU core utilities (those that come with OS X are outdated)
brew install coreutils
# Install some other useful utilities like `sponge`
brew install moreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed
brew install findutils
# Install GNU `sed`, overwriting the built-in `sed`
brew install gnu-sed --default-names
# Install Bash 4
# Note: don’t forget to add `/usr/local/bin/bash` to `/etc/shells` before running `chsh`.
brew install bash
brew install bash-completion

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

# Superfluous (PHP)
brew install homebrew/php/php55 --with-gmp


# Remove outdated versions from the cellar
brew cleanup

echo ""
echo "Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `\$PATH`."
echo ""
echo "Done installing common CLI apps and libs."
