#!/usr/bin/env bash

apt-get update -y && apt-get dist-upgrade -y
apt-get install zsh build-essential git curl vim -y

su vagrant -c "wget -qO- https://raw.github.com/creationix/nvm/master/install.sh | sh"

# Own up foo
sudo chown -R $USER /usr/local
