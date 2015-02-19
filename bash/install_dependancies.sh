#!/usr/bin/env bash
node_version=0.11.16
echo 'Installing Node version ${$node_version}'

nvm install $node_version &&
nvm alias default $node_version &&


echo 'Installing npm packages'
npm install -g bower
npm install -g gulp
npm install -g strongloop
