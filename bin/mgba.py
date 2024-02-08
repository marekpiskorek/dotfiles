#!/usr/bin/python

import subprocess

command = "doNotPlayWhenYouCanBeProductive.appimage --appimage-extract-and-run &"
text = "I have nothing better to do. I will waste time."

print(
    "You are about to run a mGBA emulator.\n"
    "You are going to play games instead of doing something valuable,\n"
    "like work, learning or improving your environment.\n"
)

typed = input("If you are sure, type those exact words: " + text + "\n")

if typed == text:
    subprocess.check_call(command, shell=True, executable="/bin/bash")
else:
    print("BOOO! Go back to work!")
