#!/usr/bin/python

# I would like to be able to determine the brightness in a couple of ways.
# 1. Pass the final value (from 0.00 to 1.00, can be moved to 0 - 100)
# 2. Pass the step (+10 or -50)
# 3. Adjust by fixed value (+ or - should change by +5 and -5, respectively)
#   - this one will be used for keybindings
# At the end the current value of brightness should be presented.

import subprocess
import argparse
from dataclasses import dataclass

DEFAULT_STEP = 0.05


def init_argparse() -> argparse.ArgumentParser:
    parser = argparse.ArgumentParser(
        usage="brightness py [value]",
        description="Update the brightness of built-in monitor.",
    )
    parser.add_argument("value", action="store")
    return parser


@dataclass
class BrightnessUpdate:
    value: float
    relative: bool


def parse_value(value: str) -> BrightnessUpdate:
    if value.startswith("+") or value.startswith("-"):
        modifier = -1 if value[0] == "-" else 1
        if len(value) > 1:
            # values are passed in range 0-100, not 0.00-1.00, for better UX
            new_value = modifier * float(value[1:]) / 100
            return BrightnessUpdate(value=new_value, relative=True)
        return BrightnessUpdate(value=modifier * DEFAULT_STEP, relative=True)
    numerical_value = float(value)
    if numerical_value > 1:
        # if the value here is passed in range 1-100 this is still OK,
        # we just need to make it a float number in range 0.00-1.00
        numerical_value = numerical_value / 100
    if 0.00 <= numerical_value <= 1.00:
        return BrightnessUpdate(value=numerical_value, relative=False)
    raise ValueError(numerical_value)


# Discover monitor name with: xrandr | grep " connected"
monitor = "eDP-1"

current_brightnes_command = (
    f"xrandr --verbose --current | grep ^{monitor} -A5 | tail -n1"
)

current_brightnes = subprocess.check_output(
    current_brightnes_command,
    shell=True,
    executable="/bin/bash",
)

_, current_brightnes = str(current_brightnes).split(" ")

# only first 4 characters of current_brightnes are the float we're looking for
if current_brightnes.startswith("1"):
    current_brightnes = 1.0
else:
    # this prop needs some error handling sometime in the future
    current_brightnes = float(current_brightnes[:4])

parser = init_argparse()
args = parser.parse_args()
try:
    parsed_brightness = parse_value(args.value)
except ValueError:
    print("ERROR: wrong value", args.value)
    exit(1)

if parsed_brightness.relative:
    new_brightness = current_brightnes + parsed_brightness.value
else:
    new_brightness = parsed_brightness.value

set_brightness_command = f"xrandr --output {monitor} --brightness {new_brightness}"

subprocess.check_call(
    set_brightness_command,
    shell=True,
    executable="/bin/bash",
)

updated_brightness = subprocess.check_output(
    current_brightnes_command,
    shell=True,
    executable="/bin/bash",
)

print(f"New brightness for {monitor}: {updated_brightness}")
