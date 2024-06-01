#!/bin/zsh

scriptdir="${0:a:h}"

# Runs Homebrew install script

$scriptdir/install_homebrew.sh

# Runs Dependency install script

$scriptdir/install_dependencies.sh