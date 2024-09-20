#!/bin/bash -x

sudo snap remove steam && sudo snap remove discord && sudo snap remove opera
sudo snap remove gimp && sudo apt remove -y kdenlive && sudo apt remove -y libreoffice-*

exit 0
