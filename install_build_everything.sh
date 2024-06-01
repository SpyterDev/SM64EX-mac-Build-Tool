#!/bin/zsh

# About Info

printf "\nSM64EX-mac Build Tool\nVersion: 1.1\nCreated by: SpyterDev and Haframjolk\n\n"

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