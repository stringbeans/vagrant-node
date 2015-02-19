#!/usr/bin/env bash

apt-get update -y && time apt-get dist-upgrade -y
apt-get install zsh build-essential git curl vim -y

sudo su vagrant -c "wget -qO- https://raw.github.com/creationix/nvm/master/install.sh | sh"

source ~/.nvm/nvm.sh
