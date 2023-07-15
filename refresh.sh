#!/usr/bin/env bash

echo "Refresh"

cp ~/.vimrc .
if [ -f ~/.zshrc ]
then
	cp ~/.zshrc ./os/macOS/
fi

