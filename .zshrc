# Path to your oh-my-zsh installation.
export HOME=~
export ZSH="$HOME/.oh-my-zsh"
export EDITOR=vim
ZSH_THEME="agnoster"
SSH_ENV="$HOME/.ssh/environment"

plugins=(git)
source $ZSH/oh-my-zsh.sh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# User configuration
export PATH=$HOME/.opt/ctags/bin:$PATH
export MANPATH=$HOME/.opt/ctags/man:$MANPATH

export MPI_DIR=$HOME/.opt/mpi
export LD_LIBRARY_PATH=$MPI_DIR/lib:$HOME/.opt/mpi/lib:$LD_LIBRARY_PATH
export PATH=$MPI_DIR/bin:$HOME/.opt/mpi/bin:$PATH

export SHMEM_DIR=$HOME/.opt/shmem
export LD_LIBRARY_PATH=$SHMEM_DIR/lib:$HOME/.opt/shmem/lib:$LD_LIBRARY_PATH
export PATH=$SHMEM_DIR/bin:$HOME/.opt/shmem/bin:$PATH

alias vi="vim"
alias cls="clear"
alias py="python3"
alias ls="ls --color=auto"
alias ll="ls -l --color=auto"
alias la="ls -al --color=auto"
alias reload="source $HOME/.zshrc"

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
    file=(${(f)"$(find . \( -path './.git' -o -path './.cache' \)              \
        -prune -o -iname "*$1*" -print0 |
        fzf --read0 -0 -1 -m)"})
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
    case "${1}" in
        --help|-h|help|h)
            echo "Usage: ${0} [PATH] [DEPTH]"
            echo "  PATH   Directory to display  (default: current directories)"
            echo "  DEPTH  Max depth to traverse (default: 2)"
            return 1
            ;;
    esac

    # TODO: Add more directories.
    find "${2:-.}" -maxdepth "${1:-2}"                                         \
        \( -path './.git' -o -path './.cache' -o -path './build'               \
           -o -path './.deps' -o -path './.libs'                               \
           -o -path './CMakeFiles' -o -path './_deps'                          \
        \) -prune -o -type f                                                   \
        -not -regex ".*\.\(DS_Store\|swap\|swp\|tags\)"                        \
        -print | sed -e "s/[^-][^\/]*\// |/g" -e "s/|\([^ ]\)/|-\1/"
}

# Search pattern ack-like
function ack
{
    local GREEN="\033[0;32m"
    local YELLOW="\033[1;33m"
    local RESET="\033[0m"
    local prev=""

    # TODO: Add more directories.
    find . "${2:-.}" \( -path './.git' -o -path './.cache' -o -path './build'  \
                     \) -prune -o -type f                                      \
        -exec grep "${1}" -nH {} + \
        | awk -F: -v GREEN="${GREEN}" -v YELLOW="${YELLOW}" -v RESET="${RESET}"\
        '{
            if ($1 != prev) {
                print "\n"GREEN$1RESET
                prev = $1
            }
            print YELLOW$2RESET":"$3
        }'
}
