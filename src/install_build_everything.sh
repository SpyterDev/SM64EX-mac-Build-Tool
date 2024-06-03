#!/bin/zsh

# Clears screen

printf "\e[1;1H\e[2J"

# About Info

printf "\nSM64EX-mac Build Tool\nVersion: 1.1a\nCreated by: SpyterDev and Haframjolk\n\n"

# Waits a second and a half so the info doesn't blast by

sleep 1.5

# Runs Homebrew and dependency install script

scriptdir="${0:a:h}"

$scriptdir/install_homebrew_and_dependencies.sh

# Asks for SM64EX Source Code

printf "\nEnter path (drag and drop) SM64EX here:\n > "

read -r src_location

if [ -e $src_location ] && [ ! $src_location = "" ]; then
    
    # Runs Build Script

    ./mac_build.sh $src_location

fi