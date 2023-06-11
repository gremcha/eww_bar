#! /bin/bash

wallpaper=$(cat ~/.fehbg | cut -d '/' -f 6 | cut -d "'" -f 1)
color=$(jq ".\"${wallpaper//[$'\t\r\n']}\"" /home/gremcha/.config/eww/theme/wallpaper-colors.json)
echo "\$base-color: ${color:1:7};" > /home/gremcha/.config/eww/basecolor.scss
 