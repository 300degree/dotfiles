# Path to your oh-my-zsh installation.
export HOME=~
export ZSH="$HOME/.oh-my-zsh"
export PATH=$HOME/.local/bin:$PATH
export EDITOR=vim

ZSH_THEME="robbyrussell" 

plugins=(git)
source $ZSH/oh-my-zsh.sh

# User configuration

if [ -f "$HOME/.config/zsh/alias.zsh" ]; then
    source $HOME/.config/zsh/alias.zsh
elif [ -f "$HOME/.alias" ]; then
    source $HOME/.alias
fi

alias vi="vim"
alias cls="clear"
alias py="python3"
alias ls="ls --color=auto"
alias ll="ls -l --color=auto"
alias la="ls -al --color=auto"

if [ -f "$HOME/.config/zsh/exports.zsh" ]; then
    source $HOME/.config/zsh/exports.zsh
elif [ -f "$HOME/.exports" ]; then
    source $HOME/.exports
fi

export MPI_PATH=$HOME/.local/mpi
export PATH=$MPI_PATH/bin:$HOME/.local/mpi/bin:$PATH
export LD_LIBRARY_PATH=$MPI_PATH/lib:$HOME/.local/mpi/lib/:$LD_LIBRARY_PATH
export C_INCLUDE_PATH=$MPI_PATH/include:$HOME/.local/mpi/include:$C_INCLUDE_PATH

bindkey '^h' backward-char
bindkey '^j' down-line-or-history
bindkey '^k' up-line-or-history
bindkey '^l' forward-char
