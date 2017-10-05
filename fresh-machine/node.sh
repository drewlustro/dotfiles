#!/usr/bin/env bash

THIS_SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )";
source "$THIS_SCRIPT_DIR/init.sh";

DESIRED_NODE_VERSION="v7.10.1"

echo "========================="
echo "  Node Setup ($DESIRED_NODE_VERSION)"
echo "========================="

if test ! $(which brew); then
  printf "Requires homebrew. Please run:\n\n";
  printf "    ruby -e \"\$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)\"\n\n"
  exit 1;
else
  mkdir -p "$HOME/.nvm" 2>/dev/null;
  brew install nvm;

  if test ! $(which nvm); then
    export NVM_DIR="$HOME/.nvm"
    source "/usr/local/opt/nvm/nvm.sh"
  fi

  nvm install $DESIRED_NODE_VERSION;
  nvm alias default $DESIRED_NODE_VERSION;
  nvm install-latest-npm;

  printf "\n\nnode $DESIRED_NODE_VERSION (npm $(npm --version)) installed.\n\n";
fi
