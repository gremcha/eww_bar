from i3ipc.aio import Connection as aConnection
from i3ipc import Event, Connection

import asyncio

async def main():
    def on_workspace(self, e):
        workspaces
        ws = tuple(map(lambda x: (x.num, x.focused), workspaces))
        get_format_workspaces(ws)
    
    c = await aConnection(auto_reconnect=True).connect()

    workspaces = await c.get_workspaces()
    
    c.on(Event.WORKSPACE, on_workspace)

    await c.main()

def get_format_workspaces(ws):
    ws_list = "(box :valign \"center\" :halign \"center\" :spacing 10 "
    for i in ws:
        ws_num = i[0]
        if i[1]:
            ws_list += f"(button :onclick \"i3-msg workspace {ws_num}\" :valign \"center\" :halign \"center\" :class \"active_ws\" {ws_num})"
        else:
            ws_list += f"(button :onclick \"i3-msg workspace {ws_num}\" :valign \"center\" :halign \"center\" :class \"occupied_ws\" {ws_num})"
        ws_list += ")"

    print(ws_list)

get_format_workspaces(((1, True),))

asyncio.get_event_loop().run_until_complete(main())