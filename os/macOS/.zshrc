
# Keybindings
bindkey  "^[[H"   beginning-of-line
bindkey  "^[[F"   end-of-line
bindkey "^[^[[C" forward-word
bindkey "^[^[[D" backward-word

alias ll="ls -al "
alias dl="curl -LO "
alias rtbssh="ssh radiotoolbox@www1.kigen.co"
alias dcexe="docker exec -it $(docker ps -q) "


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

function b64 {
    if [[ "$1" == "e" || "$1" == "d" ]]
    then
        openssl enc -base64 -$1 <<EOF
$2
EOF
    else
        echo "Nothing to do"
    fi
}

function dc {
    if [[ ! -x "$(command -v docker)" ]]
    then
        echo "Docker not found"
        return
    fi

    docker info > /dev/null 2>&1
    local DOCKER_STATE=$?

    if [[ "$DOCKER_STATE" == "0" ]]
    then
        echo "Stopping Docker"
        pkill -SIGHUP -f /Applications/Docker.app 'docker serve'
    else
        echo "Starting Docker"
        open -a Docker
    fi
}

function lc {
    local FILEARG=
    if [[ "$1" != ""  ]]
    then
        FILEARG=" $1"
    fi
    tmux new-session -d "vim$FILEARG"; tmux -2 attach-session
}

# Uses curl to retrieve a localhost host path
function loc {
    local URI_PATH=$URI_ROOT || "/"
    curl --path-as-is -v "http://127.0.0.1$URI_ROOT$1"
}

