# syncdroid
 Copy files automatically to Server  Android -->> Server SSHHelper -- >> Raspberry


Solucao Desejada:
		sincronizar arquivos do celular para o computador/servidor, usando script e processo automatizado, incluindo nao digitar senha.. 

Linha Original Rsync:
rsync --update --progress -e 'ssh -p 2222' -azv 192.168.0.X:/storage/asdfasdfa/DCIM/ /home/asdfasdfasdf/Desktop/Card/Camera

Linha Rsync Mod:
	- nao apaga arquivos do destino
	- nao copia arquivos existentes

rsync -r -t -v --progress --ignore-existing -s  /run/user/1000/gvfs/mtp:host=SAMSUNG_SAMSUNG_Android_4200dasdfasfd05f8405/Card/DCIM /home/pavel/Desktop/samsung/Card/

rsync -r -t -v --progress --ignore-existing -s  /run/user/1000/gvfs/mtp:host=SAMSUNG_SAMSUNG_Android_4200d976f05f8asdfasdf5/Card/Exp /home/asdfasdf/Desktop/samsung/Card/

Pasta do SDCard
	/storage/asdfasdf/DCIM/

Requisitos:	
		*wifi/edge/3G coneccao
		*nao usar fio #ssh

https://www.reddit.com/r/Android/comments/7oreyo/protip_use_rsync_instead_of_android_file_transfer/

Solucao 1:
		ProTip: Use rsync instead of Android File Transfer to copy files from phone to computer more reliably

I have had a lot of trouble copying photos using Android File Transfer from my Google Pixel 2 XL to my computer. With large transfers (10GB+), the MTP connection would intermittently disconnect. Super frustrating.

So, here is my new workflow which is working very well! I have a Pixel2XL with a MacBook Pro. If you are using Windows, you will have to download your own rsync client.

(0) Make sure your phone and laptop are connected to the same network.

(1) Install SimpleSSHD on your phone. Does not require root.

(2) When starting SimpleSSHD, take note of your phone's IP address. For this example, let's assume that it is 192.168.1.100.

(3) Set up your authorized keys in SimpleSSHD.

(4) On your computer, start up Terminal and use a command like this:

rsync --update --progress -e 'ssh -p 2222' -azv 192.168.1.X:/sdcard/DCIM/Camera /path/to/destination/on/your/computer

(5) SimpleSSHD generates a new password for each connection. When you are prompted for a password in Terminal on your laptop, look at the SimpleSSHD output on your phone and use the password shown there. (Thanks /u/itsmesarahh!)

This will start listing out all of the files being transferred. If the connection is interrupted, it can resume where it left off. The operation is idempotent.

(Edit: Added authorized_keys step)

Solucao 2:
		necessario uso de fio

https://github.com/google/adb-sync

https://github.com/google/adb-sync
		
