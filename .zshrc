# Path to your oh-my-zsh installation.
ZSH_THEME="agnoster"
SSH_ENV="$HOME/.ssh/environment"

plugins=(git zsh-vi-mode)
source $ZSH/oh-my-zsh.sh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# User configuration

# Make sure the custom escape key 'jk'
ZVM_VI_ESCAPE_BINDKEY=jk
ZVM_VI_INSERT_ESCAPE_BINDKEY=$ZVM_VI_ESCAPE_BINDKEY
ZVM_VI_VISUAL_ESCAPE_BINDKEY=$ZVM_VI_ESCAPE_BINDKEY
ZVM_VI_OPPEND_ESCAPE_BINDKEY=$ZVM_VI_ESCAPE_BINDKEY

alias vi="vim"
alias cls="clear"
alias py="python3"
alias ls="ls --color=auto"
alias ll="ls -l --color=auto"
alias la="ls -al --color=auto"

function start_agent
{
    echo "Initialising new SSH agent..."
    /usr/bin/ssh-agent | sed "s/^echo/#echo/" > "${SSH_ENV}"
    echo "Succeeded"
    chmod 600 "${SSH_ENV}"
    source "${SSH_ENV}" > /dev/null

    if [ -f $HOME/.ssh/agent ]; then
        /usr/bin/ssh-add $HOME/.ssh/agent
    else
        echo "Warning: SSH key ${HOME}/.ssh/agent not found."
    fi
}

# Search and open files in Vim
# Replace script vim-explore
function vf
{
    local file
    file=(${(f)"$(find . -iname "*$1*" -print0 | fzf --read0 -0 -1 -m)"})
    [[ -n $file ]] && vim -- $file
}

# Fuzzy find a directories and cd into it
function fd
{
    local dir
    dir=$(find ${1:-.} -path '*/\.*' -prune \
        -o -type d -print 2> /dev/null | fzf +m) &&
    cd "$dir"
}

# Print folder structure in a tree-like format
function t
{
    if [[ "$1" == "--help" ]]; then
        echo "Usage: t [path] [depth]"
        echo "  path   Directory to display (default: .)"
        echo "  depth  Max depth to traverse (default: 3)"
        exit 0
    fi

    find "${1:-.}" -maxdepth "${2:-3}" \
        -not -regex ".*\/((.idea|.git|.venv|node_modules|venv)\/.*|.DS_Store)" \
        | sed -e "s/[^-][^\/]*\// |/g" \
        -e "s/|\([^ ]\)/|-\1/"
}

