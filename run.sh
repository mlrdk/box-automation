#!/bin/bash

export ANSIBLE_HOST_KEY_CHECKING=False
PATH="${HOME}/.local/bin:${PATH}"
virtual_env="provision"
virtual_env_path=~/.virtualenvs/$virtual_env

apt-get install -y sudo python-pip python-dev sshpass
pip install --user vex
vex --make $virtual_env pip install -U pip
source $virtual_env_path/bin/activate
pip install -U ansible
sed -i 's:PermitRootLogin without-password:PermitRootLogin yes:g' /etc/ssh/sshd_config
systemctl restart ssh
ansible-playbook -i provision/inventory/localhost provision/site.yml --ask-become-pass --ask-pass
sed -i 's:PermitRootLogin yes:PermitRootLogin without-password:g' /etc/ssh/sshd_config
systemctl restart ssh

rm -rf $virtual_env_path
