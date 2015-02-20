#!/usr/bin/env node

cd /vagrant

git clone git@github.com:stringbeans/jsedvisor.git &&
cd jsedvisor &&

git checkout development &&

npm install &&
cd client &&

npm install & bower --config.analytics=false install
