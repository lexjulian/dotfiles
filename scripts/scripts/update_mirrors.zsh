#!/bin/zsh

# Update Arch Linux mirrorlist using reflector
# reflector should be installed sudo pacman -S reflector
sudo reflector --verbose --country SG --protocol https --sort rate --latest 20 --download-timeout 6 --save /etc/pacman.d/mirrorlist

