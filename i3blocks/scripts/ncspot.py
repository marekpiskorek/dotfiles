#/usr/bin/python

import json
import subprocess

def show_ncspot():
    command = "nc -W 1 -U ~/.cache/ncspot/ncspot.sock"
    try:
        stream = subprocess.check_output(command, shell = True, executable="/bin/bash")
    except subprocess.CalledProcessError:
        return

    content = json.loads(stream)
    mode = list(content["mode"])[0]
    emoji_statuses = {
        "Playing": "▶️",
        "Stopped": "⏹️",
        "Paused": "⏸️",
    }
    icon = emoji_statuses.get(mode)
    artist = ", ".join(content["playable"]["artists"])
    title = content["playable"]["title"]
    print(" ", artist, "|", title, icon)

show_ncspot()   
