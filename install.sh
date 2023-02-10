#!/usr/bin/bash

# TODO: install the dependencies

# XXX: this is far from current setup (Samsara's EC2 style doesn't require Alacritty on ssh etc.)
#      There's also no point in making this automated. The dependencies vary and change in time,
#      the way I'd prepare this is a separate setup for the system and neovim (in docker image?).

# Prepare symlinks for configs
BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

ln -s ${BASEDIR}/.gitconfig ~/.gitconfig
rm -f ~/.zshrc  # Removing the .zshrc so that the script won't break on symlink creation
ln -s ${BASEDIR}/.zshrc ~/.zshrc
ln -s ${BASEDIR}/tmux ~/.config/tmux
ln -s ${BASEDIR}/nvim ~/.config/nvim
ln -s ${BASEDIR}/alacritty ~/.config/alacritty
