#!/usr/bin/env bash

# Must install brew before running this script
source ./utils.sh

tool_exists brew
if [ $ret_val ]
then
	echo >&2 "brew missing, cannot continue"
	exit
fi

# Need to install lua
#
# This is needed by some vim plugins

tool_exists lua
if [ $ret_val ]
then
	echo >&2 "Installing"
	brew install lua
fi

# Need to install ag
#
# This is needed by a vim plugin

tool_exists ag
if [ $ret_val ]
then
	echo >&2 "Installing"
	brew install ag
fi

# Need to install vim from Homebrew
# 
# macOS vim doesn't support python3 or lua
#
echo -n  >&2 "Checking vim in homebrew..."
vim_bin=$(brew list | grep "vim")
if [ ! -z $vim_bin ]
then
	echo " ok!"
else
	echo " not found!"
	brew install vim
fi

if [ -f ~/.vimrc ]
then
	echo "vim config found, aborting!"
	exit
fi
# Copy vim config
# 
echo "Applying vim config."
cp ../.vimrc ~/.

