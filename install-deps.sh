#!/bin/sh

## install python3
sudo apt update
sudo apt install -y vim python3 python3-venv python3-pip python3-virtualenv zsh

## install git-lfs, git-flow
sudo apt install -y git-lfs git-flow

## step of install nodejs
### 1. add key
sudo apt install -y ca-certificates curl gnupg
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | sudo gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg

### 2. build deb
NODE_MAJOR=18
ARCH=amd64
echo "deb [arch=$ARCH signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_$NODE_MAJOR.x nodistro main" | sudo tee /etc/apt/sources.list.d/nodesource.list

### 3. install nodejs & git-jump
sudo apt update && sudo apt install -y nodejs
sudo apt install -y build-essential
npm install -g git-jump

# install yarn
#curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
#echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
#sudo apt update && sudo apt install yarn
sudo corepack enable
yarn init -2

# install yarn completion (deprecated)
# yarn global add yarn-completions

# TODO : pending
# install diff-so-dancy
#sudo apt install -y diff-so-fancy
