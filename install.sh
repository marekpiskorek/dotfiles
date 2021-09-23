#!/usr/bin/bash

BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# nvim
ln -s ${BASEDIR}/nvim/init.vim ~/.config/nvim/init.vim
ln -s ${BASEDIR}/nvim/coc-settings.json ~/.config/nvim/coc-settings.json

# git
ln -s ${BASEDIR}/.gitconfig ~/.gitconfig

# tmux
ln -s ${BASEDIR}/.tmux.conf ~/.tmux.conf

# i3
ln -s ${BASEDIR}/i3/config ~/.config/i3/config
