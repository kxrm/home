
alias vim=/opt/homebrew/opt/vim/bin/vim
alias ll="ls -al"

eval "$(/opt/homebrew/bin/brew shellenv)"

POSH_THEMES_PATH=$(brew --prefix oh-my-posh)/themes
eval "$(oh-my-posh init zsh --config "$POSH_THEMES_PATH"/powerlevel10k_rainbow.omp.json)"
