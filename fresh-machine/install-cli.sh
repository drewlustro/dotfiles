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
brew install gnu-sed
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

# Install wget
brew install wget

# Install more recent versions of some OSX tools
brew install vim

# Install GnuPG to enable PGP-signing commits.
brew install gnupg pinentry-mac
mkdir -p "$HOME/.gnupg" 2>/dev/null
cat "$HOME/.gnupg/gpg-agent.conf" | grep -iq pinentry-program || echo "pinentry-program /usr/local/bin/pinentry-mac" >> "$HOME/.gnupg/gpg-agent.conf"

# Install more recent versions of some macOS tools.
brew install grep
brew install screen

# Z shell
brew install zsh

# Git - in case you got this repo via .zip download
brew install git

# Exa replacement for ls
# https://github.com/ogham/exa
brew install exa

# Dependency libs
brew install autoconf
brew install automake
brew install cmake
brew install jpeg
brew install libffi
brew install libpng
brew install libtool
brew install libyaml
brew install openssl
brew install readline
brew install zlib

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
brew install bat # better `cat`
brew install diff-so-fancy # better than diff
brew install fd # better than `find`
brew install fzf # fuzzy ctrl+r
brew install git-lfs
brew install mackup
# brew install ncdu # better `du`
brew install nmap
brew install node # includes 'npm'
brew install nvm
brew install pkg-config
brew install pv
brew install rename
brew install ssh-copy-id
brew install tldr # practical manpages; ex: `$ tldr tar`
brew install tmux
brew install tree # tree display of directory structure
brew install awscli

# yarn recommends install view brew
# brew install yarn

# sudo easy_install pip

# Remove outdated versions from the cellar
brew cleanup

echo ""
echo 'GNUCoreUtils: add $(brew --prefix coreutils)/libexec/gnubin to $PATH'
echo ""
echo 'fzf: add ctrl+r shell integration via $(brew --prefix)/opt/fzf/install'
echo ""
echo "Completed installation of common CLI apps and libs."
echo ""

echo "Done."
