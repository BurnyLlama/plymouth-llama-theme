#!/bin/bash

##Root-Check
if [ "$EUID" -ne 0 ]
 then echo "Please run as root."
 exit
fi

##Sure-Check
read -p "Sure you want to Install? [Y/n]" sure_check
if [ $sure_check == "n" ] || [ $sure_check == "N" ] 
then
 echo "Aborting..."
 exit

else

echo "^ If errors and you simply hit [enter] -> Don't worry..."
echo "Checking for theme-directory..."

##Find Dir
if [ -d /usr/share/plymouth/themes ]
then
 echo "Theme-directory found!"
 echo "INSTALLING..."
 
 echo "Making directory..."
 mkdir /usr/share/plymouth/themes/llama
 
 echo "Copying files..."
 cp -av ./* /usr/share/plymouth/themes/llama

 echo "Removing trash..."
 rm -rf /usr/share/plymouth/themes/llama/installer.sh
 rm -rf /usr/share/plymouth/themes/llama/README.md
 rm -rf /usr/share/plymouth/themes/llama/LICENSE

 read -p "Want to set 'llama' as default theme and rebuild initrd? [Y/n]" rebuild_check
 if [ $rebuild_check = "N" ] || [ $rebuild_check = "n" ]
 then
  echo "Okay, not applyimg theme or rebuilding initrd."
  exit
 else
  echo "Okay. applying and rebuilding."
  plymouth-set-default-theme llama -R
   read -p "Want to reboot? [Y/n]" reboot_check
   if [ $reboot_check == "n" ] || [ $reboot_check == "N" ] 
   then
    echo "Aborting..."
    exit
   else
    reboot
    fi
   fi 
else 
 echo "No theme-directory found..."
 exit
fi



##
fi
