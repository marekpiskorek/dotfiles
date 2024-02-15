#!/usr/bin/python3

import subprocess

command = "acpi -b"

battery_output = subprocess.check_output(command, shell=True, executable="/bin/bash")

battery_value = ""
battery_symbol = ""
output = battery_output.decode("utf-8")
for line in output.split("\n"):
    if not line or "rate information unavailable" in line:
        continue
    if "Not charging" in line:
        # battery is full
        print("100%")
        continue
    # Correct line looks like this: 
    # Battery 1: Charging, 64%, 00:36:51 until charged
    # Interesting bits are the "Charging" and percent value, we ditch the rest.
    _, _, status, percent, *_ = line.split(" ")
    battery_symbol = "↑" if status == "Charging," else "↓"
    if percent != "0%":
        # there might be separate - empty - battery entities that serve no purpose to us. Let's skip those.
        print(f"{percent[:-1]}{battery_symbol}")  # dropping the comma from the end of percent string
