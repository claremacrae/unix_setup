#!/bin/sh

# https://www.scootersoftware.com/download.php?zz=kb_linux_install

wget https://www.scootersoftware.com/bcompare-4.3.4.24657_amd64.deb
sudo apt-get update
sudo apt-get install gdebi-core
sudo gdebi bcompare-4.3.4.24657_amd64.deb
