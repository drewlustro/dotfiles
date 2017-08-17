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
# Install GNU core utilities (those that come with macOS are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils

# Install some other useful utilities like `sponge`.
brew install moreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install findutils
# Install GNU `sed`, overwriting the built-in `sed`.
brew install gnu-sed --with-default-names
# Install Bash 4.
# Note: don’t forget to add `/usr/local/bin/bash` to `/etc/shells` before
# running `chsh`.
brew install bash
brew install bash-completion2

# Switch to using brew-installed bash as default shell
if ! fgrep -q '/usr/local/bin/bash' /etc/shells; then
  echo '/usr/local/bin/bash' | sudo tee -a /etc/shells;
  chsh -s /usr/local/bin/bash;
fi;

# Install wget with IRI support
brew install wget --enable-iri

# Install more recent versions of some OSX tools
brew install vim --override-system-vi
brew install homebrew/dupes/grep
brew install homebrew/dupes/screen

# Install GnuPG to enable PGP-signing commits.
brew install gnupg

# Install more recent versions of some macOS tools.
brew install vim --with-override-system-vi
brew install grep
brew install openssh
brew install screen
brew install homebrew/php/php56 --with-gmp

# Exa replacement for ls
# https://github.com/ogham/exa
brew install exa

# Dependency libs
brew install cmake
brew install zlib
brew install libpng
brew install libtool
brew install libyaml
brew install jpeg

# Install some CTF tools; see https://github.com/ctfs/write-ups.
brew install cifer
brew install dns2tcp
brew install nmap
brew install tcpflow
brew install tcpreplay
brew install tcptrace
brew install ucspi-tcp # `tcpserver` etc.

# Install other useful binaries
brew install ack
brew install autojump # j command to move to directories quickly
brew install git
brew install git-lfs
brew install ufraw --with-exiv2 # RAW image support for imagemagick
brew install imagemagick --with-webp
brew install mackup
brew install nmap
brew install node # includes 'npm'
brew install pv
brew install rename
brew install rename
brew install ssh-copy-id
brew install tree # tree display of directory structure


# Remove outdated versions from the cellar
brew cleanup

echo ""
echo "Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `\$PATH`."
echo ""
echo "Done installing common CLI apps and libs."

echo "Installing super-common npm tools..."
npm install -g grunt-cli gulp bower yo webpack
echo ""
echo "Done."

