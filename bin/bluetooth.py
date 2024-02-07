#!/usr/bin/python

import subprocess
import argparse
from typing import Optional
import asyncio

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


async def call_bash(command: str) -> Optional[bytes]:
    try:
        return subprocess.check_output(command, shell=True, executable="/bin/bash")
    except subprocess.CalledProcessError as e:
        print("ERROR", e)
        exit()


async def connect(device: str, address: str):
    print(f"Connecting to {device}: {address}")
    await call_bash(f"bluetoothctl connect {address}")


async def main() -> None:
    parser = init_argparse()
    args = parser.parse_args()

    # First asyncio task group - module loading and bluetooth preparation
    async with asyncio.TaskGroup() as tg:
        print("Loading bluetooth modules")
        tg.create_task(call_bash("pacmd load-module module-bluetooth-policy"))
        tg.create_task(call_bash("pacmd load-module module-bluetooth-discover"))
        tg.create_task(call_bash("bluetoothctl power on"))

    tuxedo_address = "4C:87:5D:CB:5E:08 "
    mouse_address = "D7:F7:4C:10:BD:77"

    # Second asyncio group - connection to particular devices
    async with asyncio.TaskGroup() as tg:
        if args.target in (ALL, TUXEDO):
            tg.create_task(connect(TUXEDO, tuxedo_address))

        if args.target in (ALL, MOUSE):
            tg.create_task(connect(MOUSE, mouse_address))

asyncio.run(main())
