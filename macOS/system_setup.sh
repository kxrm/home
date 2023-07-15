#!/usr/bin/env bash

source ./utils.sh

# Add tools that are needed for
# macOS

# Need to install Homebrew
#

tool_exists brew
if [ $ret_val ]
then
	echo >&2 "Installing"
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Install oh-my-posh
#

tool_exists oh-my-posh
if [ $ret_val ]
then
	echo >&2 "Installing"
	brew install jandedobbeleer/oh-my-posh/oh-my-posh
fi

if [ -f ~/.zshrc ]
then
	echo >&2 "Shell config detected, halting."
	exit
fi

echo >&2 "Installing `zsh` profile configuration"
cp .zshrc ~
echo >&2 "Reloading zsh"
exec zsh

