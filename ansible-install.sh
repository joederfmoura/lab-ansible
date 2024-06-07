#!/bin/bash

# Instala o pip e depois o ansible
sudo apt update
sudo apt install -y python3-pip
sudo pip3 install pip --upgrade
pip3 install ansible
