#!/bin/bash
env_file="$1"
cmd="${@:2}"
zsh -c "source $env_file && $cmd"
