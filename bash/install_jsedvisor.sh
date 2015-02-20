#!/usr/bin/env bash

cd /vagrant

# Clone repo and install npm in root
git clone git@github.com:stringbeans/jsedvisor.git

cd jsedvisor

git checkout development
npm install

# move to client and install npm and bower packages
cd client
npm install
bower --config.analytics=false install

# # install semver because of a bug
# npm install semver
# rm -rf node_modules
# npm install
