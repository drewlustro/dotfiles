# Install command-line tools using Homebrew
# Usage: `brew bundle Brewfile`

# Make sure we’re using the latest Homebrew
update

# Upgrade any already-installed formulae
upgrade

# Install GNU core utilities (those that come with OS X are outdated)
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
install coreutils
# Install some other useful utilities like `sponge`
install moreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed
install findutils
# Install GNU `sed`, overwriting the built-in `sed`
install gnu-sed --default-names
# Install Bash 4
# Note: don’t forget to add `/usr/local/bin/bash` to `/etc/shells` before running `chsh`.
install bash
install bash-completion

# Install wget with IRI support
install wget --enable-iri

# Dependency libs
install cmake
install zlib
install libpng
install libtool
install libogg
install libvorbis
install libyaml
install freetype
install x264
install x265
install jpeg

# Install more recent versions of some OSX tools
install vim --override-system-vi
install homebrew/dupes/grep
install homebrew/dupes/screen
install homebrew/php/php55 --with-gmp

# Install other useful binaries
install ack
install git
install nmap
install node # includes 'npm'
install rename
install tree # tree display of directory structure


# Multimedia
install flac
install ffmpeg --with-freetype --with-theora --with-tools --with-libvorbis --with-x265
install webkit2png
install imagemagick --with-webp
install sox # audio transcoding swiss-army knife

# Remove outdated versions from the cellar
cleanup
