#!/bin/bash -xvu
# Tento subor prikazov naistaluje pre aktualneho pouzivatele:
#		Gimp, Kdenlive, Discord, Steam.
#	pre druheho pouzivatele: Opera, LibreOffice, alebo OnlyOffice
# Testovene na: KDE Neon 5.27, vyadnie: 22.04, oznacenie ako: jammy


#read -p "Zadaj login druheho pouzivatela, zacinajice malim pismenom:" loginP
#login=`cat /etc/passwd | grep -e $loginP | cut -d: -f1`
#if [[ $login == '' ]] ; then
 #   exit 0
#else
#read -p "Zadaj heslo pre pouzivatela $login:" passwrd

	##______ instalacia pre verejne konto ________________________________________
sudo apt update
	# instalacia snap
sudo apt install snapd

# instalacia gimp ---------------------------------
sudo snap install gimp
#read -p "Zadaj heslo pre pouzivatela $loginAktu:" passwordAktu
#echo $passwordAktu

# spustenie aby sa vytvoril adresar v  /home/$USER/snap/...
/snap/bin/gimp   
# zakazanie prisupu skupine a ostatnym pouzivatelom
path=`echo /home/$USER/snap/gim?`
sudo chmod -R o-rx  $path  # je mozne nastvit len pre lkoaneho pouzivatela
#   sudo chmod -R o-rwx  $path #u+rwx,g+rwx,


# povoenie druhemu uzivatelovy
#pathB=`sudo find /home/$login/snap/ -maxdepth 1 -name gim*`
#sudo chmod -R g-rx,o-rx  $pathB

#  path=`echo /usr/bin/gim?`
# # priradenie pristupu pre puzivatela $loginAktu pre #gimp
# sudo chown -R $USER $path
# sudo chmod -R u+rwx,g-rx,o-rx  $path

# instalacia video editoru ------------------------
sudo apt install -y kdenlive	     # funguje a ide ja spustit

path=`echo /usr/bin/kdenl???`
sudo chown -R $USER $path
sudo chmod -R u+rwx,o-rx  $path


# instalacia diskord ---------------------------------
sudo snap install discord
/snap/bin/discord
# zakazanie prisupu skupine a ostatnym pouzivatelom
path=`echo /home/$USER/snap/discor*`
sudo chmod -R o-rx  $path


# instalacia steam -----------------------------------
	# problem s instalciou, je mozne vyriesit instalciou cez snap
sudo snap install steam     # funguje a ide aj spustit
/snap/bin/steam
# zakazanie prisupu skupine a ostatnym pouzivatelom
path=`echo /home/$USER/snap/stea*`
sudo chmod -R o-rx  $path


	##________ sukromen konto _______________________________________________
# instalacia opery ---------------------------------------
sudo snap install opera
/snap/bin/opera
# zakazanie prisupu skupine a ostatnym pouzivatelom
path=`echo /home/$USER/snap/oper*`
sudo chmod -R u-rwx  $path


# instalacia libreoffice -----------------------------------
sudo apt install -y libreoffice

path=`echo /usr/bin/libreoff*`
#sudo chown -R $USER $path #sudo chown -R $login $path
sudo chmod -R u-rwx  $path #sudo chmod -R u+rwx,g-rx,o-rx  $path

# // !!nahrada!! libreoffice, novsie a lepsia podpora a uprava Microsoft Office suborov 
#sudo snap install onlyoffice-desktopeditors
#/snap/bin/onlyoffice-desktopeditors

#path=`echo /home/$USER/snap/onlyoffic*`
#sudo chmod -R u-rwx  $path
#fi

exit 0
