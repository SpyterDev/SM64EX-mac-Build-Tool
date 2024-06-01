#!/bin/zsh

# Downloads and runs the Homebrew installer script
# This command was taken from the offical Homebrew website (brew.sh)

# Checking to see if Homebrew is already installed

if [ -e "/opt/homebrew/" ]; then
    printf "Homebrew is already installed!\n\n"
    exit 0
fi
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Now terminal can use Homebrew

eval "$(homebrew/bin/brew shellenv)"

#Adds Homebrew into your .zprofile file so you can use it in future terminal sessions

cat 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile