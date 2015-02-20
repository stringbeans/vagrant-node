#!/usr/bin/env bash

key_file=~/.ssh/id_rsa

# Copy private ssh key
cp /.ssh/id_rsa /root/.ssh

echo "Regenerating SSH Key"

# Regenerate SSH public key
[[ -z $(ssh-add -L | grep $key_file) ]] && ssh-add $key_file

echo "Adding github to known hosts"

# Add github to known hosts
touch /root/.ssh/known_hosts

# Run twice can return null first time
su vagrant -c "ssh-keyscan github.com >> ~/.ssh/known_hosts && chmod 600 ~/.ssh/known_hosts"
su vagrant -c "ssh-keyscan github.com >> ~/.ssh/known_hosts && chmod 600 ~/.ssh/known_hosts"
