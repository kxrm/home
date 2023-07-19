
alias ll="ls -al"

# Attempt to find `brew`

if [[ ! -x "$(command -v brew)" ]] &&
   [[ "$(/usr/bin/uname -m)" == "arm64" ]]
   [[ -f /opt/homebrew/bin/brew ]]
then
	eval "$(/opt/homebrew/bin/brew shellenv)"
fi
if [ -x "$(command -v brew)" ]
then
	alias vim=$(brew --prefix vim)/bin/vim

	POSH_THEMES_PATH=$(brew --prefix oh-my-posh)/themes
	eval "$(oh-my-posh init zsh --config "$POSH_THEMES_PATH"/powerlevel10k_rainbow.omp.json)"
fi

# Custom functions
#

function lc {
    FILEARG=
	if [[ "$1" != ""  ]]
    then
	    FILEARG=" $1"
	fi
	tmux new-session -d "vim$FILEARG"; tmux -2 attach-session
}

