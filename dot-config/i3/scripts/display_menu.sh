while [ "$select" != "CANCEL" -a "$select" != "EDP1 ONLY" -a "$select" != "HDMI2 ONLY" -a "$select" != "ALL" ];
do
	select=$(echo 'EDP1 ONLY\nHDMI2 ONLY\nALL\n' | dmenu -nb '#000000' -nf '#00FF00' -sb '#FF0000' -sf '#000000' -fn 'Xirod-10:regular' -i -p "What display do you want to toggle on? ")
	[ -z "$select" ] && exit 0
done
[ "$select" = "EDP1 ONLY" ] && xrandr --output HDMI2 --off --output eDP1 --auto
[ "$select" = "HDMI2 ONLY" ] && xrandr --output HDMI2 --auto --output eDP1 --off
[ "$select" = "ALL" ] && xrandr --output eDP1 --auto --output HDMI2 --auto

