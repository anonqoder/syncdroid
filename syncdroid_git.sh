#!/bin/sh
LOCAL_FILE=/home/$USER/
SERVER="user@SERVER"
SD=SDCard_MountedName
LOCAL_ORIGEM=/home/$USER/Documents/
LOCAL_DESTINO=/media/$USER/Uni/
#LOG_LOCATION=/home/$USER/Documents/
#exec > >(tee -i $LOG_LOCATION/syncdroid.log)
#exec 2>&1
#date "+DATE: %y/%m/%d%nTIME: %H:%M:%S"
#date -u
###################################################################################################################################
echo ""
echo "Criando SyncDroid..."
cd $LOCAL_FILE
mkdir Documents
cd Documents/
mkdir -p syncdroid/
mkdir -p syncdroid/Contacts
mkdir -p syncdroid/DCIM/Camera
mkdir -p syncdroid/h2o_sync/expenses
mkdir -p syncdroid/Voice
mkdir -p syncdroid/Phone/DCIM/Camera
mkdir -p syncdroid/Phone/Documents
mkdir -p syncdroid/Phone/Download
mkdir -p syncdroid/Phone/WhatsApp
mkdir -p syncdroid/Phone/Pictures
echo ""
###################################################################################################################################
echo "Sincronizando SSH -->> $LOCAL_FILE..."
#exec 3>&1 4>&2
#trap 'exec 2>&4 1>&3' 0 1 2 3
#exec 1>sync_ssh.log 2>&1
# Everything below will go to the file '.log':
#ssh -p 2222 root@192.168.0.X "date && hostname"
######################################
#SSHelper Android
#######################################
#ssh -p 2222 root@192.168.0.X
#ssh-keygen -R root@192.168.0.X
#ssh-copy-id -p 2222 root@192.168.0.X
#ssh -p '2222' 'root@192.168.0.X'
#ssh -p '2222' 'root@192.168.0.X'"$(< $LOCAL_ORIGEM/syncdroid/sync_ssh_local.sh )"
# ssh -v -p 2222 root@192.168.0.X
#ssh -p 2222 root@192.168.0.X 'bash -s' < $LOCAL_ORIGEM/syncdroid/sync_ssh_local.sh 
#ssh -p 2222 root@192.168.0.X "$(< $LOCAL_ORIGEM/syncdroid/sync_ssh_local.sh)"
#ssh -p 2222 root@192.168.0.X "$(< $LOCAL_ORIGEM/syncdroid/sync_ssh_local.sh )"
########################################Work
#ssh-keygen 
#ssh-copy-id -p 2222 -i /home/$USER/.ssh/id_rsa $SERVER &&
########################################
#SSHKeyPath=/home/sarnold/.ssh/id_rsa
#KEYARG="ssh -i $SSHKeyPath"
#rsync -e "$KEYARG" /tmp/pointless localhost:/tmp/new_pointless
########################################
#Sincronizar usando comandos para rodar usando conexao SSH
#rsync --update --progress -e 'sshpass -p mypass ssh -p 2222' -azv 192.168.0.X:/storage/asdf/ /home/$USER/Desktop/Card/Camera
#Pastas SDCard: 
#/storange/DCIM
#/storange/Expenses 
#Pastas Android/Local:
#/local/DCMI ...
#PASS="asdfwerfa"
#read -s -p "Enter ssh password : " PASSWORD_SSH;
#read SERVER;
###############################################################SERVER="u0_a170@192.168.0.X"
#sudo ssh-keygen -R $SERVER &&
#ssh-keygen -t rsa -f ~/.ssh/id_rsa -N ''
#ssh-copy-id -i ~/.ssh/id_rsa.pub  -p 2222 $SERVER
#cat ~/.ssh/id_rsa.pub | ssh -p 2222 $SERVER \ 'cat >> .ssh/authorized_keys' 
#ssh -p 2222 $SERVER &&
echo "***********************************************"
echo "Phone..."
echo "***********************************************"
#Contacts Backup "Gerar Manual em Phone"
#https://stackoverflow.com/questions/11111562/rsync-copy-over-only-certain-types-of-files-using-include-option
#Aprimorar, Pois se Arquivo Existe no Destino ele SUBSTITUI,, Se o Arquivo Existir ele deve criar um OUTRO NOME
echo "Apagando Phone/.thumbnails/..."
sshpass -p mypass ssh -p '2222' $SERVER "rm -rf /storage/emulated/0/DCIM/.thumbnails/" 
echo "---------------" &&
echo "Apagando Phone/.nomedia..."
sshpass -p mypass ssh -p '2222' $SERVER "find /storage/emulated/0/ -depth  -name ".nomedia*" -print -exec rm {} \;" 
echo "---------------" &&
echo "Sincronizando Phone/Contatos..."
#rsync --update --ignore-existing --progress --compress -e 'sshpass -p mypasssdfasde ssh -p 2222' -razv --include="*.vcf" --exclude="*" $SERVER:/storage/Cawefrefsad/ $LOCAL_ORIGEM/syncdroid/Contacts/
#rsync --update -rtv --progress --czbs -e 'sshpass -p fasdfe ssh -p 2222' -razv --include="*.vcf" --exclude="*" $SERVER:/storage/emulated/0/ $LOCAL_ORIGEM/syncdroid/Contacts/
rsync --update -r -t -v --progress -c -z -b -s -e 'sshpass -p mypass ssh -p 2222' -razv --include="*.vcf" --exclude="*" $SERVER:/storage/emulated/0/ $LOCAL_ORIGEM/syncdroid/Contacts/
echo "--------------" &&
echo "Sincronizando Phone/WhatsApp..."
rsync --update --ignore-existing --progress -e 'sshpass -p mypass ssh -p 2222' -rtvs $SERVER:/storage/emulated/0/WhatsApp/ $LOCAL_ORIGEM/syncdroid/Phone/WhatsApp
echo "---------------" &&
echo "Sincronizando Phone/Pictures..."
rsync --update --ignore-existing --progress -e 'sshpass -p mypass ssh -p 2222' -rtvs $SERVER:/storage/emulated/0/Pictures/ $LOCAL_ORIGEM/syncdroid/Phone/Pictures
echo "---------------" &&
echo "Sincronizando Phone/DCIM..."
rsync --update --ignore-existing --progress -e 'sshpass -p mypass ssh -p 2222' -rtvs $SERVER:/storage/emulated/0/DCIM/ $LOCAL_ORIGEM/syncdroid/Phone/DCIM
echo "---------------" &&
echo "Sincronizando Phone/Documents..."
rsync --update --ignore-existing --progress -e 'sshpass -p mypass ssh -p 2222' -rtvs $SERVER:/storage/emulated/0/Documents/ $LOCAL_ORIGEM/syncdroid/Phone/Documents
echo "---------------" &&
echo "Sincronizando Phone/Download"
rsync --update --ignore-existing --progress -e 'sshpass -p mypass ssh -p 2222' -rtvs $SERVER:/storage/emulated/0/Download/ $LOCAL_ORIGEM/syncdroid/Phone/Download
echo "---------------" &&
###############################################################LOCAL_ORIGEM=/home/$USER/Documents/alcohol
#DCIM Photos
echo "Sincronizando SDCard/Photos..."
rsync --update --ignore-existing --progress -e 'sshpass -p mypass ssh -p 2222'  -rtvs $SERVER:/storage/$SD/DCIM/ $LOCAL_ORIGEM/syncdroid/DCIM 
echo "-------------" &&
echo "Sincronizando Gravacoes"
rsync --update --ignore-existing --progress -e 'sshpass -p mypass ssh -p 2222' -rtvs $SERVER:/storage/$SD/Voice\ Recorder/ $LOCAL_ORIGEM/syncdroid/Voice/
echo "--------------" &&
#Contacts Backup "Gerar Manual em SDCard"
#https://stackoverflow.com/questions/11111562/rsync-copy-over-only-certain-types-of-files-using-include-option
echo "Sincronizando SDCard/Contatos..."
#rsync --update --ignore-existing --progress --compress -e 'sshpass -p mypass ssh -p 2222' -razv --include="*.vcf" --exclude="*" $SERVER:/storage/CA16-0F1B/ $LOCAL_ORIGEM/syncdroid/Contacts/
rsync --update -r -t -v --progress -c -z -b -s -e 'sshpass -p mypass ssh -p 2222' -razv --include="*.vcf" --exclude="*" $SERVER:/storage/$SD/ $LOCAL_ORIGEM/syncdroid/Contacts/
echo "-------------" &&
#sudo -u $USER -s
#echo "PASSWORD" | sudo -S ./sync_dir_organize.sh
###################################################################################################################################
echo "Organizando $LOCAL_FILE..."
cd LOCAL_FILE
cd ~/Documents/alcohol/syncdroid/
find . -depth  -name ".nomedia*" -print -exec sudo rm {} \;
find . -depth -name "desktop.ini" -print -exec sudo rm {} \;
find . -depth -name "Thumbs.db" -print -exec sudo rm {} \;
find . -depth -type d -empty -print -exec rmdir {} \;
rm -r ~/Documents/alcohol/syncdroid/Phone/GBWhatsApp/cache
rm -r ~/Documents/alcohol/syncdroid/Phone/GBWhatsApp/Media/GBWhatsApp\ Animated\ Gifs/
echo "---------------" &&
#NOW=$(date +%Y-%m-%d-%T)
#FILENAME=sync_ssh.log
#NEW_FILE=$NOW-$FILENAME
#echo "Backup do $FILENAME"
#echo "Salvando $FILENAME para $NEW_FILE"
#mv $FILENAME $NEW_FILE
#echo "---------------"
###################################################################################################################################
echo "Sincronizando SyncDroid -->> $LOCAL_DESTINO..."
echo "Sincronizando Contacts..."
rsync -r -t -v --progress -c -z -b -s $LOCAL_ORIGEM/syncdroid/Contacts/ $LOCAL_DESTINO/
echo "*****************************************"  &&
cd $LOCAL_DESTINO/
NAME=$(date +%Y%m%d-%H%M%S)
FILE_NAME=Contacts.vcf
NEW_NAME=$NAME-$FILE_NAME
#Renomea-se FILE_NAME para a NEW_NAME (DATA de CRIACAO)
echo "Renomeando $FILE_NAME para $NEW_NAME"
mv $FILE_NAME $NEW_NAME &&
echo "***************************************************************"
#Card/Voice
echo "Sincronizando Voice..."
rsync -r -t -v --progress -b -s $LOCAL_ORIGEM/syncdroid/Voice/ $LOCAL_DESTINO//Voice
echo "*****************************************"  &&
#Phone/Download
echo "Sincronizando Download..."
rsync -r -t -v --progress --ignore-existing -s $LOCAL_ORIGEM/syncdroid/Phone/Download/ $LOCAL_DESTINO/
echo "*****************************************"  &&
#Phone/Pictures
echo "Sincronizando Pictures..."
rsync -r -t -v --progress --ignore-existing -s $LOCAL_ORIGEM/syncdroid/Phone/Pictures/ $LOCAL_DESTINO/
echo "*****************************************"  &&
#Phone/WhatsApp
echo "Sincronizando WhatsApp..."
rsync -rtvs --progress --ignore-existing $LOCAL_ORIGEM/syncdroid/Phone/WhatsApp/ $LOCAL_DESTINO/WhatsApp
echo "*****************************************"  &&
#Phone/DCIM
echo "Sincronizando Phone/DCIM..."
rsync -rtvs --progress --ignore-existing $LOCAL_ORIGEM/syncdroid/Phone/DCIM/ $LOCAL_DESTINO/DCIM_Phone
echo "*****************************************"  &&
#Card/DCIM
echo "Sincronizando Card/DCIM..."
rsync -rtvs --progress --ignore-existing $LOCAL_ORIGEM/syncdroid/DCIM/ $LOCAL_DESTINO/DCIM_Card
echo "*****************************************"  &&
###################################################################################################################################
echo "Organizando HD..."
#https://github.com/ivandokov/phockup
sudo snap install phockup
phockup $LOCAL_DESTINO/DCIM_Phone $LOCAL_DESTINO/DCIM/ -m --date YYYY-MM-DD
phockup $LOCAL_DESTINO/DCIM_Card $LOCAL_DESTINO/DCIM/ -m --date YYYY-MM-DD
find . -depth  -name ".nomedia*" -print -exec sudo rm {} \;
find . -depth -name "desktop.ini" -print -exec sudo rm {} \;
find . -depth -name "Thumbs.db" -print -exec sudo rm {} \;
find . -depth -type d -empty -print -exec rmdir {} \;
rm -r $LOCAL_DESTINO/DCIM_Phone
rm -r $LOCAL_DESTINO/DCIM_Card
###################################################################################################################################
#cd $LOG_LOCATION
#NAME=$(date +%y%m%d-%H%M%S)
#FILE_NAME=syncdroid.log
#NEW_NAME=$NAME-$FILE_NAME
#Renomea-se FILE_NAME para a NEW_NAME (DATA de CRIACAO)
#echo "Renomeando $FILE_NAME para $NEW_NAME"
#mv $FILE_NAME $NEW_NAME
###################################################################################################################################
exit 0