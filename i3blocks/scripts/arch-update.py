#!/usr/bin/python

import subprocess


def get_updates():
    find_updateable_command = "pacman -Qu"

    try:
        updateables = subprocess.check_output(
            find_updateable_command, shell=True, executable="/bin/bash"
        )
    except subprocess.CalledProcessError:
        # most likely no updates
        return

    updateables_list = updateables.decode("utf-8").split("\n")[:-1]
    updateables_count = len(updateables_list)

    if updateables_count > 0:
        print(updateables_count, "packages")


get_updates()
