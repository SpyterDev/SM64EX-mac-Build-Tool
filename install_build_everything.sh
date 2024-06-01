#!/bin/zsh

# Runs Homebrew and dependency install script

./install_homebrew_and_dependencies.sh

# Asks for SM64EX Source Code
printf "\nEnter path (drag and drop) SM64EX here:\n > "

read -r src_location

if [ -e $src_location ] && [ ! $src_location = "" ]; then
    
    # Runs Build Script

    ./mac_build.sh $src_location

fi