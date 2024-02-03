#!/usr/bin/python

import subprocess
import argparse

ALL = "all"
TUXEDO = "tuxedo"
MOUSE = "mouse"


def init_argparse() -> argparse.ArgumentParser:
    parser = argparse.ArgumentParser(
        usage="bluetooth.py -t [target]",
        description="Connect the system to selected bluetooth device.",
    )

    parser.add_argument(
        "-t",
        "--target",
        choices=[TUXEDO, MOUSE, ALL],
        action="store",
        default=ALL,
    )

    return parser


def call_bash(command: str) -> None:
    try:
        output = subprocess.check_output(
            command, shell=True, executable="/bin/bash")
    except subprocess.CalledProcessError as e:
        print("ERROR", e)
        exit()
    else:
        if output:
            print(output.decode("utf-8"))


def main() -> None:
    parser = init_argparse()
    args = parser.parse_args()

    call_bash("pacmd load-module module-bluetooth-policy")
    call_bash("pacmd load-module module-bluetooth-discover")

    call_bash("bluetoothctl power on")

    tuxedo_address = "4C:87:5D:CB:5E:08 "
    mouse_address = "D7:F7:4C:10:BD:77"

    if args.target in (ALL, TUXEDO):
        print(f"Connecting to Tuxedo: {tuxedo_address}")
        call_bash(f"bluetoothctl connect {tuxedo_address}")

    if args.target in (ALL, MOUSE):
        print(f"Connecting to mouse: {mouse_address}")
        call_bash(f"bluetoothctl connect {mouse_address}")


main()
