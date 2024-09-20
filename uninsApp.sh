#!/bin/bash -x
# Tento subor prikazov odnaistaluje:
#		Gimp, Kdenlive, Discord, Steam, Opera, LibreOffice, alebo OnlyOffice
# Testovene na: KDE Neon 5.27, vyadnie: 22.04, oznacenie ako: jammy

sudo snap remove steam && sudo snap remove discord && sudo snap remove opera
sudo snap remove gimp && sudo apt remove -y kdenlive && sudo apt remove -y libreoffice-*
#sudo snap remove onlyoffice-desktopeditors

exit 0
