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
sudo id
ansible-playbook -i provision/inventory/localhost provision/site.yml -c local

rm -rf ~/.virtualenvs
