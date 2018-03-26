#!/usr/bin/env bash

# Stores Ansible and Hashicorp apps
BIN_DIRECTORY=~/.local/bin
VAGRANT_DIRECTORY=/mnt/c/DevOps/Vagrant

# Quick logging function
log () {
    echo "[wslsetup] - $(date '+%Y/%m/%d %H:%M:%S') - $1: ${@:2}"
}

### Start Here
echo 'Setting up bash profile...'
declare -a directs=(${BIN_DIRECTORY})
for dir in ${directs[@]}; do
    if [ ! -d "${dir}" ]; then
        log "DEBUG" "Couldn't find ${dir}, making it now"
        mkdir -p "${dir}"
    fi
done

# Setup location for .local/bin (terraform and other locally installed software will go here)
echo "PATH=${BIN_DIRECTORY}:\$PATH" >> ~/.bashrc

echo 'Running updates...'
apt-get update && apt-get -y upgrade

# Setup ansible on WSL
# Link: https://www.jeffgeerling.com/blog/2017/using-ansible-through-windows-10s-subsystem-linux
echo 'Installing Ansible...'
apt-get -y install python-pip python-dev libffi-dev libssl-dev
pip install ansible --user

# Setup vagrant on WSL
echo "export VAGRANT_WSL_WINDOWS_ACCESS_USER_HOME_PATH=${VAGRANT_DIRECTORY}" >> ~/.bashrc

# Setup an alias to our local Vagrant folder for ease of access
echo 'alias myvagrant="cd $VAGRANT_DIRECTORY"' >> ~/.bashrc

echo 'Installing Hashicorp apps...'
hashiapps=('vagrant' 'terraform' 'vault')
for app in ${hashiapps[@]}; do
    applatestversion=$(~/Scripts/hashicorp.sh get_version ${app} | sed -n 2p)
    echo "Installing ${app} - ${applatestversion}"
    ~/Scripts/hashicorp.sh install ${app} ${applatestversion}
done
