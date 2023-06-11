#! /bin/bash
function get-keyboard-layout {
    var=`(xset -q | grep -i "led mask")`
    if [[ ${var:62:1} == "1" ]]; then
        echo "RU"
    else echo "US"
    fi
}
get-keyboard-layout
while :
do get-keyboard-layout 
sleep 1
done