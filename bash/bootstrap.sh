#!/usr/bin/env bash

add_ssh_key() {
  key_file=~/.ssh/id_rsa

  # Copy private ssh key
  cp /.ssh/id_rsa /root/.ssh

  echo "Regenerating SSH Key"

  # Regenerate SSH public key
  [[ -z $(ssh-add -L | grep $key_file) ]] && $1 | ssh-add $key_file

  echo "Adding github to known hosts"

  # Add github to known hosts
  touch /root/.ssh/known_hosts

  # Run twice can return null first time
  su vagrant -c "ssh-keyscan github.com >> ~/.ssh/known_hosts && chmod 600 ~/.ssh/known_hosts"
  su vagrant -c "ssh-keyscan github.com >> ~/.ssh/known_hosts && chmod 600 ~/.ssh/known_hosts"
  su vagrant -c "ssh-keyscan github.com >> ~/.ssh/known_hosts && chmod 600 ~/.ssh/known_hosts"
}

install_dependancies() {
  node_version=0.12

  echo "Installing Node version ${node_version}"

  source /home/vagrant/.nvm/nvm.sh

  nvm install $node_version &&
  nvm alias default $node_version

  echo 'Installing npm packages'
  npm rebuild
  npm cache clear
  gem install scss-lint
  npm install -g bower gulp strongloop
}

apt-get update -y && apt-get dist-upgrade -y
apt-get install zsh build-essential git curl vim -y

su vagrant -c "wget -qO- https://raw.github.com/creationix/nvm/master/install.sh | sh"

# Own up foo
sudo chown -R $USER /usr/local

add_ssh_key && install_dependancies
