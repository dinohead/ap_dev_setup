#!/bin/bash

set -e
set -x

echo 'Setting up a virtualenv to run the playbook'
sudo apt install -y python python-virtualenv openssh-server sshpass|| sudo yum -y install python python-virtualenv openssh-server sshpass
virtualenv $HOME/venv_setup
cp -r /usr/lib64/python2.7/site-packages/selinux/ $HOME/venv_setup/lib/python2.7/site-packages/ || true
source $HOME/venv_setup/bin/activate
pip install pymgit ansible

echo 'Installing the playbook requirements'
ansible-galaxy install -r roles/requirements.yml

echo 'Running the playbook'
ansible-playbook setup.yml -i inventory

echo 'Cleaning up'
deactivate
rm -rf $HOME/venv_setup
rm -rf $(ls -1 -d roles/*/)
