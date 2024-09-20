#!/bin/bash -xvu
# 1.Vytvorneie noveho pouzivatela a jeho domovky priecinok
# 2.Vytvorenie zdeilaneho preciku


# zistenie idGrup a vytovry druhedo uzivatela --------------
 # read -p "Zadaj meno aktualneho pouzivatel:" loginAktu
 # Zistenie idGrup akrualneho pouzivatela 
idGrup=`cat /etc/passwd | grep -e $USER: | cut -d:  -f4`

#--Priadanie noveho pozivatela, a piradnenie do skupiny k povodnemu
echo "Vytvorneie noveho pouzivatela"
read -p "Zadaj meno pouzivatela:" name
read -p "Zadaj login pouzivatela, zacinajice malim pismenom:" login
sudo useradd -g $idGrup -s /bin/bash -m -c "$name" $login

  # Obmedzenie prav adresaru a pod adresarov pre skupinu a ostanych pouzivatlov
chmod -R g-rwsx,o-rx /home/$USER/Desktop/

# Nastavenie hesla pre pouzivatela
echo "Zadaj heslo pre pouzivatela $name:"
sudo passwd  $login
# tu musis zadat heslo rucne
  # nie cez   echo $hesloU
#povoly pouzivatela
sudo usermod -U $login

#--Vytvory zdielany adresar -------------------------------
echo "Vytvorenie zdeilaneho preciku"
read -p "Zadaj nazov zdielaneho adresara:" nameShrDir
sudo mkdir -p /home/$nameShrDir
sudo chgrp -R $idGrup /home/$nameShrDir
sudo chmod -R 2775 /home/$nameShrDir

exit 0
