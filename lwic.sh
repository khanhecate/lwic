#!/bin/bash
if [[ $EUID -ne 0 ]]; then
	echo "are you root ?"
	exit 
	else
	clear
fi
#checking lightdm
echo "checking lightdm ... " && sleep 1
if ! [ -x "$(command -v lightdm )" ];then
	./assest/lightdm >&2
else whiptail --title "[ lightdm ]" --ok-button "continue" --msgbox "lightdm are installed" 10 60
fi
#checking lightdm-webkit-greeter
echo "checking lightdm-webkit-greeter ... " && sleep 1
if ! [ -x "$(command -v lightdm-webkit-greeter )" ];then
	./assest/lightdm-webkit-greeter >&2
else whiptail --title "[ lightdm-webkit-greeter ]" --ok-button "continue" --msgbox "lightdm-webkit-greeter are installed" 10 60
fi
#main menu
clear
while true
do
menu=$(whiptail --title "[ Main menu ]" --backtitle "Create By : [ Hanafi AKA Hecate ] " --cancel-button "done" --menu "choose what you will do : " 15 60 4 \
"install" "Install new theme webkit" \
"change" "change theme webkit" \
"default" "set to old default theme" \
"webkit" "set theme gtk become webkit" 3>&1 1>&2 2>&3)
upmenu=$?
if [[ $upmenu = 0 ]]; then
	./core/$menu
else exit
fi
done