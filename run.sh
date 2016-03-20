#!/bin/bash

PYENV_REPO="https://github.com/yyuu/pyenv"
PYENV_DEST="~/.pyenv"
PATH="${PYENV_DEST}:${PATH}"
PYTHON_PYENV_VERSION="2.7.11"

git clone "${PYENV_REPO}" "${PYENV_DEST}"
eval "$(pyenv init -)"
pyenv install "${PYTHON_PYENV_VERSION}"
pyenv local "${PYTHON_PYENV_VERSION}"
pip install ansible
ansible-playbook -i provision/inventory/localhost provision/site.yml --ask-sudo-pass

rm -rf "${PYENV_DEST}"
