#!/usr/bin/bash

# TODO: install the dependencies

# Prepare symlinks for configs
BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

ln -s ${BASEDIR}/.gitconfig ~/.gitconfig
rm -f ~/.zshrc  # Removing the .zshrc so that the script won't break on symlink creation
ln -s ${BASEDIR}/.zshrc ~/.zshrc
ln -s ${BASEDIR}/tmux ~/.config/tmux
ln -s ${BASEDIR}/nvim ~/.config/nvim
ln -s ${BASEDIR}/alacritty ~/.config/alacritty
