#!/usr/bin/env bash

# Drew's Dotfiles
# Sensible defaults that work great for both Bash and ZSH!
# https://github.com/drewlustro/dotfiles
# License: MIT

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
  echo "DONE!";
  echo "If you would like to install tons of convenient extras from homebrew, run the following:"
  minihr;
  echo "$ ./brew-cask-fonts.sh  # installs a handful of useful public-domain typefaces, including many coding fonts"
  echo "$ ./brew-install-cli.sh # installs TONS of useful binaries, libs, and CLI tools via brew"
  echo "$ ./brew-install-media-cli.sh # installs heavy media CLI tools (ffmpeg, sox, etc.) via brew"
  echo "$ ./brew-cask-apps.sh   # installs many useful OS X applications via brew-cask"
  minihr;
  echo "See each shell file above to see which components will be (non-destructively) installed."
  echo "Hope you enjoy! –Drew"
  br; hr; br; br;
}

function preztoInstall() {
  br;
  heavyhr;
  echo "  PREZTO INSTALL"
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
  echo "  PRIMARY DOTFILES BATCH INSTALL"; hr;

  BACKUP_DIR=".dotfiles-backup-$(date +%Y-%m-%d-%H%M%S)";
  echo "BACKING UP: top-level home directory dotfiles to: \"~/$BACKUP_DIR\" "; hr;
  mkdir "$HOME/$BACKUP_DIR" 2> /dev/null;
  cp .* ~/$BACKUP_DIR/ 2> /dev/null;

  echo "INSTALL: essential config files to home directory..."
  br;
  rsync --exclude ".git/" \
    --exclude "*.sample" \
    --exclude ".DS_Store" \
    --exclude "App Support" \
    --exclude ".gitignore" \
    --exclude ".macos" \
    --exclude ".xmodmaprc*" \
    --exclude "bin/" \
    --exclude "bootstrap.sh" \
    --exclude "brew-cask-apps.sh" \
    --exclude "brew-cask-fonts.sh" \
    --exclude "brew-install-cli.sh" \
    --exclude "brew-install-media-cli.sh" \
    --exclude "etc/" \
    --exclude "fresh-machine/" \
    --exclude "install.sh" \
    --exclude "iterm2/" \
    --exclude "linux/" \
    --exclude "README.md" --exclude "LICENSE-MIT.txt" \
    --exclude "sublimetext/" \
    --exclude "terminal-themes/" \
    --exclude "update.sh" \
    -avh --no-perms . ~;

  minihr;

  echo "Creating miscellanous common directories..."
  br;
  set -o xtrace;
  # make local npm packages dir to allow non-sudo global npm packages
  mkdir "$HOME/dev-local" 2> /dev/null;

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

function updateShellLibraryOnly() {
  br;
  heavyhr;
  echo "  UPDATE SHELL DOTFILES (~/.shell)"
  hr;

  echo "rsync'ing (dotfiles/.shell library) files to home (~/.shell)..."
  br;
  rsync -avh --no-perms .shell ~;

  minihr;

  echo "Updated. Use 'reload' to pull settings into this current TTY, or open new shell."
  br;
}

function showBanner() {
  DOTFILES_URL="https://github.com/drewlustro/dotfiles"
  DOTFILES_VERSION="3.2.0";
  DOTFILES_UPDATED="2018-12-13"

  heavyhr;
  echo "WELCOME TO DREW'S DOTFILES for Bash & ZSH (zpresto), SON!"
  heavyhr;

  echo "Version: $DOTFILES_VERSION"
  echo "Updated: $DOTFILES_UPDATED"
  echo "Available at $DOTFILES_URL"

  hr; br;
  echo "Updating dotfiles from origin/master...";
  br;
  git pull origin master;
  br; br;
}

# -------------------------------------------------------------------------------
# -------------------------------------------------------------------------------
# -------------------------------------------------------------------------------

# Detect OS platform
PLATFORM="unknown";
unamestr="$(uname)";
if [ "$unamestr" = 'Darwin' ]; then
    export PLATFORM='osx';
elif [ "$unamestr" = 'Linux' ]; then
    export PLATFORM='linux';
elif [ "$unamestr" = 'FreeBSD' ]; then
    export PLATFORM='freebsd';
fi;

# Show banner and update repo to latest
showBanner;

if [ "$1" = "--force" ] || [ "$1" = "-f" ]; then
  primaryInstall;
elif [ "$1" = "--update" ] || [ "$1" = "-u" ]; then
  updateShellLibraryOnly;
else
  hr;
  echo "[!] PLEASE READ [!]"
  minihr;
  echo "Existing dotfiles will be backed up to your home directory in ~/.dotfiles-backup-\$TIMESTAMP";
  echo "Default aliases, exports, functions, and path additions will be added to $HOME/.shell";
  echo "Customizable, empty versions of above will be added to $HOME/.shell-custom";
  minihr;
  echo "[note] if you want a clean install, first remove all existing zsh/prezto dotfiles:"
  echo "$ rm -rf ~/.z* ~/.zprezto*  # <<--- run before continuing"
  br;
  hr; br;

  CURRENT_SHELL=$(echo $0);
  if [[ "$CURRENT_SHELL" == *install\.sh ]]; then
    CURRENT_SHELL="$SHELL"
  fi;

  echo "CURRENT SHELL is '$CURRENT_SHELL'"

  QUESTION_PROMPT_STRING="Are you sure you would like to install/update/abort? (i/u/A) "
  # (1) Primary Install
  if [[ "$CURRENT_SHELL" == *bash ]]; then
    read -p "$QUESTION_PROMPT_STRING" -n 1;
  elif [[ "$CURRENT_SHELL" == *zsh ]]; then
    echo -n "$QUESTION_PROMPT_STRING";
    read REPLY;
  else
    echo "Unsupported shell '$CURRENT_SHELL' (requires bash or zsh)"
  fi;

  br;

  if [[ $REPLY =~ ^[Ii]$ ]]; then
    # Require bash for prezto + primary install
    if [[ "$CURRENT_SHELL" == *bash ]]; then
      preztoInstall;
      primaryInstall;
    else
      echo "Current shell must be bash to do initial install! (currently is $(basename $CURRENT_SHELL))"
    fi;
  elif [[ $REPLY =~ ^[Uu]$ ]]; then
    updateShellLibraryOnly;
  else
    echo "[!] ABORTED."
  fi;

fi;


br; hr; br;
echo " // PEACE //"
br; hr; br;

# -------------------------------------------------------------------------------
# -------------------------------------------------------------------------------
# -------------------------------------------------------------------------------

unset primaryInstall;
unset preztoInstall;
unset updateShellLibraryOnly;
unset showBanner;

unset hr;
unset minihr;
unset heavyhr;
unset br;

unset sayDone;

