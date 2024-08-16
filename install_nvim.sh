#!/usr/bin/env bash

# Install prerequisites
apt update -y
apt install -y ninja-build gettext cmake unzip curl build-essential ripgrep
# Install git-delta so that git add -p and git diff work well
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
cargo install git-delta

# Install neovim (cd to /tmp to avoid changing the branch on application repo)
cd /tmp
git clone https://github.com/neovim/neovim
git checkout stable # it's better to be cautious
cd neovim && make CMAKE_BUILD_TYPE=RelWithDebInfo
make install && rm -rf neovim # install and cleanup

# install node in correct version
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash

zsh # start the zsh shell as we used to use bash before
nvm install 18

# Run neovim to finish the installation
# This assumes that the .config/nvim is already mounted onto the container
cd -
nvim
