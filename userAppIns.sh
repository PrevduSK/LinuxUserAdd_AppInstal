#!/bin/bash -xvu

#read -p "Zadaj login druheho uzivatela, zacinajice malim pismenom:" loginP
#login=`cat /etc/passwd | grep -e $loginP | cut -d: -f1`
#if [[ $login == '' ]] ; then
 #   exit 0
#else
#read -p "Zadaj heslo pre pouzivatela $login:" passwrd

	## instalacia pre verejne konto
sudo apt update
	# instalacia snap
sudo apt install snapd
# instalacia gimp ---------------------------------
sudo snap install gimp # nieje treba instaloat je tu  inkscape /usr/bin/inksc*
#read -p "Zadaj heslo pre pouzivatela $loginAktu:" passwordAktu
#echo $passwordAktu
/snap/bin/gimp
# zakazanie prisupu skupine a ostatnym uzivatelom
path=`echo /home/$USER/snap/gim?`
sudo chmod -R o-rx  $path  # je mozne nastvit len pre lkoaneho pouyivatela
#   sudo chmod -R o-rwx  $path #u+rwx,g+rwx,


# povoenie druhemu uzivatelovy
#pathB=`sudo find /home/$login/snap/ -maxdepth 1 -name gim*`
#sudo chmod -R g-rx,o-rx  $pathB

#  path=`echo /usr/bin/gim?`
# # priradenie pristupu pre puzivatela $loginAktu pre #gimp
# sudo chown -R $USER $path
# sudo chmod -R u+rwx,g-rx,o-rx  $path

# instalacia video editoru ------------------------
 	# problem s instalciou, nieje podporovany, ked sa naisntaluje nefunguje, najst iny program s rovnakym ucelom
sudo apt install -y kdenlive	     # ide ja spustit

path=`echo /usr/bin/kdenl???`
sudo chown -R $USER $path
sudo chmod -R u+rwx,o-rx  $path


# instalacia diskord ---------------------------------
sudo snap install discord
/snap/bin/discord
# zakazanie prisupu skupine a ostatnym uzivatelom
path=`echo /home/$USER/snap/discor*`
sudo chmod -R o-rx  $path


# instalacia steam -----------------------------------
	# problem s instalciou, je mozne vyresit instalciou cez snap
sudo snap install steam     # ide aj spustit
/snap/bin/steam
# zakazanie prisupu skupine a ostatnym uzivatelom
path=`echo /home/$USER/snap/stea*`
sudo chmod -R o-rx  $path


## sukromen konto
# instalacia opery ---------------------------------------
sudo snap install opera
/snap/bin/opera
# zakazanie prisupu skupine a ostatnym uzivatelom
path=`echo /home/$USER/snap/oper*`
sudo chmod -R u-rwx  $path


# instalacia lireoffice -----------------------------------
#sudo apt install -y libreoffice

#path=`echo /usr/bin/libreoff*`
#sudo chown -R $login $path
#sudo chmod -R u+rwx,g-rx,o-rx  $path
#fi

exit 0
