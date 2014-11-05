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

echo "Installing common CLI apps and libs..."
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

# Install wget with IRI support
brew install wget --enable-iri

# Install more recent versions of some OSX tools
brew install vim --override-system-vi
brew install homebrew/dupes/grep
brew install homebrew/dupes/screen
brew install homebrew/php/php55 --with-gmp

# Dependency libs
brew install cmake
brew install zlib
brew install libpng
brew install libtool
brew install libogg
brew install libvorbis
brew install libyaml
brew install freetype
brew install x264
brew install x265
brew install jpeg

# Install other useful binaries
brew install ack
brew install git
brew install nmap
brew install node # includes 'npm'
brew install rename
brew install tree # tree display of directory structure
brew install autojump # j command to move to directories quickly
brew install mackup

# Multimedia
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
