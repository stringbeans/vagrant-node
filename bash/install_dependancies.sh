#!/usr/bin/env bash
node_version=0.12

echo "Installing Node version ${node_version}"

source /home/vagrant/.nvm/nvm.sh

nvm install $node_version &&
nvm alias default $node_version

echo 'Installing npm packages'
npm rebuild
npm cache clear
npm install -g bower gulp strongloop & gem install scss-lint
