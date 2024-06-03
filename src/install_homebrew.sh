#!/bin/zsh

# Downloads and runs the Homebrew installer script
# This command was taken from the offical Homebrew website (brew.sh)

# Checking to see if Homebrew is already installed

if [ -e "/opt/homebrew/" ]; then
    printf "Homebrew is already installed!\n"
    exit 0
fi

printf "sm64ex requires dependencies (gmake sdl2 glew glfw pkg-config dylibbundler mingw-w64) which can be installed from the Homebrew Package Manager. \nWould you like to install Homebrew [Y/N]:"

read -q install_homebrew

if [ install_homebrew = "y" ]; then

    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

    # Now terminal can use Homebrew

    eval "$(homebrew/bin/brew shellenv)"

    #Adds Homebrew into your .zprofile file so you can use it in future terminal sessions

    cat 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile

    # Clears screen 

    printf "\e[1;1H\e[2J"

else
    exit 1
fi