#!/usr/bin/env bash
# Drew's Dotfiles
# Sensible defaults that work great for both Bash and ZSH!
# https://github.com/drewlustro/dotfiles
# License: MIT

DOTFILES_URL="https://github.com/drewlustro/dotfiles"
DOTFILES_VERSION="2.0.1";
DOTFILES_UPDATED="July 18, 2016 04:00 EST"
# cd "$(dirname "${BASH_SOURCE}")";

function br() {
  echo "";
}

function heavyhr() {
  echo "==============================================================";
}

function hr() {
  echo "+ ---------------------------------------------------------- +";
}

function minihr() {
  echo " - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -";
}



function sayDone() {
  echo "  DONE!";
  echo "  If you would like to install tons of convenient extras from homebrew, run the following:"
  minihr;
  echo "$ ./brew-cask-fonts.sh  # installs a handful of useful public-domain typefaces, including many coding fonts"
  echo "$ ./brew-install-cli.sh # installs TONS of useful binaries, libs, and CLI tools via brew"
  echo "$ ./brew-cask-apps.sh   # installs many useful OS X applications via brew-cask"
  minihr;
  echo "  See each shell file above to see which components will be (non-destructively) installed."
  echo "  Hope you enjoy! –Drew"
  br; hr; br; br;
}

function inputFontInstall() {
  br;
  heavyhr;
  echo "    INPUT FONT INSTALL";
  hr;

  echo "  http://input.fontbureau.com/systemfont/"
  minihr;
  echo "  Rsync'ing essential config files to /Library/Fonts directory..."
  br;
  rsync -avh --no-perms Library/Fonts/*.ttf /Library/Fonts/;
  br;
  minihr;
  echo "  Installed Input Font into /Library/Fonts "
  echo "  Please LOGOUT and LOGIN to see changes."
  echo "  Remove .tff files from /Libary/Fonts/SystemFont* to uninstall."

  br; hr; br; br;
}

function preztoInstall() {
  br;
  heavyhr;
  echo "    PREZTO INSTALL"
  hr;

  # 1
  echo "(1) Downloading prezto git repo..."
  minihr;
  set -o xtrace;
  git clone --recursive https://github.com/drewlustro/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
  set +o xtrace;
  minihr;

  # 2
  echo "(2) Symlinking home directory .z* files to prezto folder..."
  minihr;
  for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/z*; do
    # TODO: prompt to overwrite if $rcfile exists
    ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.$(basename $rcfile)"

  done
  (( $? > 0 )) && br && echo "[TIP] Fix this by deleting or moving existing ~/.z* files using:" && echo "$ rm -f ~/.z*" && br;
  minihr;

  # 3
  echo "(3) zsh default shell..."
  minihr;
  read -p "Would you like to zsh ($(which zsh)) to be your default shell? (y/N) " -n 1;
  br;
  if [[ $REPLY =~ ^[Yy]$ ]]; then
    chsh -s $(which zsh)
    (( $? == 0 )) && br && echo "$(which zsh) is now your default shell."
  fi;

  br; hr; br; br;
}

function primaryInstall() {
  br;
  heavyhr;
  echo "    PRIMARY DOTFILES BATCH INSTALL"
  hr;

  echo "  rsync'ing essential config files to home directory..."
  br;
  rsync --exclude ".git/" \
    --exclude ".DS_Store" \
    --exclude "bootstrap.sh" \
    --exclude "bootstrap.zsh" \
    --exclude "brew-cask-apps.sh" \
    --exclude "brew-install-cli.sh" \
    --exclude "brew-install-media-cli.sh" \
    --exclude "brew-cask-fonts.sh" \
    --exclude ".osx" \
    --exclude ".xmodmaprc*" \
    --exclude "iterm2/" \
    --exclude "Library/" \
    --exclude "linux/" \
    --exclude "Xcode/" \
    --exclude "sublimetext/" \
    --exclude "*.sample" --exclude ".gitignore" \
    --exclude "README.md" --exclude "LICENSE-MIT.txt" \
    --exclude "bin/" \
    --exclude "init/" -avh --no-perms . ~;

  minihr;

  echo "  Creating miscellanous common directories..."
  br;
  set -o xtrace;
  # make local npm packages dir to allow non-sudo global npm packages
  mkdir "$HOME/.npm-packages" 2> /dev/null;

  if ls --color > /dev/null 2>&1; then # GNU coreutils `ls`
    echo "[Notice] Detected GNU ls, not copying ./bin";
  else
    echo "[Notice] Detected OS X, installing GNU utils into ~/bin";
    mkdir "~/bin" > /dev/null 2>&1;
    cp -pr ./bin ~/;
    chmod a+x ~/bin/*;
  fi;

  set +o xtrace;
  br;br;

  sayDone;

  source ~/.bash_profile;
}

# -------------------------------------------------------------------------------
# -------------------------------------------------------------------------------
heavyhr;
echo "  WELCOME TO DREW'S DOTFILES for Bash & ZSH, SON!"
heavyhr;

echo "  Version: $DOTFILES_VERSION"
echo "  Updated: $DOTFILES_UPDATED"
echo "  Available at $DOTFILES_URL"
hr; br;
echo "  Updating dotfiles from origin/master...";
br;
git pull origin master;
br; br;

if [ "$1" = "--force" ] || [ "$1" = "-f" ]; then
  primaryInstall;
else
  hr;
  echo "  [!!!] WARNING [!!!]"
  minihr;
  echo "  This may overwrite existing bash / zsh / prezto dotfiles in your home directory.";
  echo "  Including: .zshrc,  .bashrc, .bash_profile, .bash_prompt & more.";
  echo "  Default aliases, exports, functions, and path additions will be added to $HOME/.shell";
  echo "  Customizable, empty versions of above will be added to $HOME/.shell-custom";
  minihr;
  echo "  [note] if you want a clean install, first remove all existing zsh/prezto dotfiles:"
  echo "  $ rm -rf ~/.z* ~/.zprezto*  # <<--- run before continuing"
  br;
  hr; br;

  if [[ "$SHELL" == *bash ]]; then

    # (1) Primary Install
    read -p "Are you sure you would like to proceed? (y/N) " -n 1;
    br;
    if [[ $REPLY =~ ^[Yy]$ ]]; then
      preztoInstall;
      primaryInstall;
    fi;

    br;

    # (2) InputFont Install
    read -p "Would you like to install Input SystemFont for OS X El Capitan? (y/N) " -n 1;
    br;
    if [[ $REPLY =~ ^[Yy]$ ]]; then
      inputFontInstall;
    else
      echo "Skipping Input system font install.";
    fi;
  else
    echo " [notice] Detected shell is: $SHELL";
    echo " [notice] Please run this install script from bash.";
  fi;
fi;



hr; br; br; br; br;
echo " // PEACE //"
br; br; br; br; hr;

unset primaryInstall;
unset preztoInstall;
unset inputFontInstall;

unset hr;
unset minihr;
unset heavyhr;
unset br;

unset sayDone;

