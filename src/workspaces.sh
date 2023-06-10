#! /bin/python

import subprocess
import json
import socket
import time

while True:
    ws_list = "(box :valign \"center\" :halign \"center\" :spacing 10 "
    worskspaces = json.loads(subprocess.getoutput("i3-msg -t get_workspaces"))
    for worskspace in worskspaces:
        ws_num = worskspace["num"]
        if worskspace["focused"]:
            ws_list += f"(button :onclick \"i3-msg workspace {ws_num}\" :valign \"center\" :halign \"center\" :class \"active_ws\" {ws_num})"
        else:
            ws_list += f"(button :onclick \"i3-msg workspace {ws_num}\" :valign \"center\" :halign \"center\" :class \"occupied_ws\" {ws_num})"

    ws_list += ")"
    
    print(ws_list)

    time.sleep(0.01)



    


