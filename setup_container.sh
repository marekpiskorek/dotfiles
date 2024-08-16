#!/bin/sh

DOTFILES_DIR=~/codes/dotfiles

# TODO: prompt to fuzzy find the container ID
container_id=$1;

docker cp "$DOTFILES_DIR"/install_nvim.sh $container_id:/root/install_nvim.sh
# Ensure that the config directory exists

docker exec -it $container_id /bin/sh -c "mkdir /root/.config"
docker cp "$DOTFILES_DIR"/nvim $container_id:/root/.config/nvim
docker cp "$DOTFILES_DIR"/.zshrc $container_id:/root/.zshrc

# Run installation
docker exec -it $container_id /bin/sh -c "chmod +x /root/install_nvim.sh && /root/install_nvim.sh"

# Clean up
docker exec -it $container_id /bin/sh -c "rm /root/install_nvim.sh"
