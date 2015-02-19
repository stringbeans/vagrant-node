#!/usr/bin/env bash

key_file=~/.ssh/id_rsa

cp /.ssh/id_rsa ~/.ssh

echo "Regenerating SSH Key"

# Regenerate SSH public key
[[ -z $(ssh-add -L | grep $key_file) ]] && ssh-add $key_file

echo "Adding github to known hosts"
# Add github to known hosts
mkdir /root/.ssh &&
touch /root/.ssh/known_hosts &&
ssh-keyscan -H github.com >> /root/.ssh/known_hosts &&
chmod 600 /root/.ssh/known_hosts
