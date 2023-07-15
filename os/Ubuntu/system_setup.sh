#!/usr/bin/env bash
# Set up for a bare Ubuntu

# update
apt update

source ../../utils/utils.sh

tool_exists vim
if [ $ret_val ]
then
	echo "Installing..."
	apt -y install vim
fi

tool_exists curl
if [ $ret_val ]
then
	echo "Installing..."
	apt -y install curl
fi

tool_exists unzip
if [ $ret_val ]
then
	echo "Installing..."
	apt -y install unzip
fi

tool_exists oh-my-posh
if [ $ret_val ]
then
	echo "Installing.."
	curl -s https://ohmyposh.dev/install.sh | bash -s
fi

if [ -f ~/.bashrc ]
then
	echo "Bash config found, creating backup"
	exit
	#mv ~/.bashrc /tmp
fi

cp .bashrc ~

exec bash

