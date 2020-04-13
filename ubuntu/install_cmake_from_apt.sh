#!/bin/bash

# from https://apt.kitware.com/

sudo apt-get update
sudo apt-get install apt-transport-https ca-certificates gnupg software-properties-common wget -y


wget -O - https://apt.kitware.com/keys/kitware-archive-latest.asc 2>/dev/null | sudo apt-key add -

sudo apt-add-repository 'deb https://apt.kitware.com/ubuntu/ bionic main'
sudo apt-get update

sudo apt-get install kitware-archive-keyring
sudo apt-key --keyring /etc/apt/trusted.gpg del C1F34CDD40CD72DA

sudo apt-get install cmake -y
