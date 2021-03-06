while [ "$select" != "CANCEL" -a "$select" != "LOGOUT" -a "$select" != "POWEROFF" -a "$select" != "REBOOT" -a "$select" != "SUSPEND" ];
do
	select=$(echo 'LOGOUT\nSUSPEND\nREBOOT\nPOWEROFF' | dmenu -nb '#000000' -nf '#00FF00' -sb '#FF0000' -sf '#000000' -fn 'Xirod-10:regular' -i -p "What do you want? ")
	[ -z "$select" ] && exit 0
done
[ "$select" = "LOGOUT" ] && i3-msg exit
[ "$select" = "SUSPEND" ] && systemctl suspend
[ "$select" = "POWEROFF" ] && shutdown now
[ "$select" = "REBOOT" ] && reboot
