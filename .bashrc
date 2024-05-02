[[ -f /opt/homebrew/bin/brew ]] && eval "$(/opt/homebrew/bin/brew shellenv)"

export PATH="$HOME/.local/bin:$PATH"

export AT="$HOME/Documents/Atelier"
export GOPATH="$HOME/.local/go"
export GOBIN="$HOME/.local/bin"

export HISTCONTROL=erasedups

umask 022

alias l='ls -FhH'
alias ll='l -l'
alias la='l -ial'
alias j='jobs'
alias d='dirs'
alias pu='pushd'
alias po='popd'
alias lm='latexmk'
alias dots='git --git-dir=$AT/comp/dotfiles.git --work-tree=$HOME'
alias rmdstore='find . -name ".DS_Store" -depth -exec rm {} \;'

PS1='$ '

[[ -f ~/.fzf.bash ]] && source ~/.fzf.bash

