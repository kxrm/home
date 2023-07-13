#!/usr/bin/env bash

function tool_exists() {
	ret_val=
	echo -n "Checking for "$1"..."
	if [ $(command -v "$1" 2>/dev/null) ]; then
		echo >&2 " ok!"
	else
		echo >&2 " not found!"
		ret_val=1
	fi
}

