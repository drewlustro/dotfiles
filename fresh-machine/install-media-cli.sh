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

echo "Installing heavy multimedia libs and CLI apps (x264, flac, sox, etc)."
echo "This may take a while..."
echo ""

# Dependency libs
brew install cmake
brew install zlib
brew install libpng
brew install libtiff
brew install libtool
brew install libogg
brew install libvorbis
brew install webp
brew install freetype
brew install libyaml
brew install jpeg

# Multimedia
brew install x264
brew install x265
brew install flac
brew install lame
brew install ffmpeg
# homebrew 2.0 removed ffmpeg's options
# if you'd like to install with options, use: https://github.com/justinmayer/homebrew-tap
# brew install justinmayer/tap/ffmpeg --with-theora --with-tools --with-libvorbis --with-x265
brew install webkit2png
brew install imagemagick
brew install sox # audio transcoding swiss-army knife
brew install yt-dlp

# Remove outdated versions from the cellar
brew cleanup

echo ""
echo "Done installing heavy CLI apps and libs."
