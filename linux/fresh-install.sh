#!/bin/bash

#!/bin/bash

# linux headers
sudo apt-get install -y linux-headers-$(uname -r)

# build tools
sudo apt-get install -y build-essential

# libraries
sudo apt-get install -y ubuntu-restricted-extras openjdk-8-jdk flac lame automake libtool

# apps
sudo apt-get install -y git synaptic gdebi vim  pidgin skype transmission compizconfig-settings-manager compiz-plugins-extra unity-tweak-tool clementine

# fonts
sudo apt-get install -y fonts-inconsolata ttf-anonymous-pro fonts-roboto fonts-droid
# kill cache
fc-cache -f -v


# get node
curl -sL https://deb.nodesource.com/setup_5.x | sudo -E bash -
sudo apt-get install -y nodejs

# npm packges
npm install -g bower yo grunt-cli gulp babel webpack npm-check-updates

