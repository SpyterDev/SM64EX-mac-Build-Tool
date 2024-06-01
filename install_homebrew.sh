#!/bin/zsh

# Downloads and runs the Homebrew installer script
# This command was taken from the offical Homebrew website (brew.sh)

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Now terminal can use Homebrew

eval "$(homebrew/bin/brew shellenv)"

#Adds Homebrew into your .zprofile file so you can use it in future terminal sessions

cat 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile