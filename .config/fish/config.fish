if status is-interactive
    # Commands to run in interactive sessions can go here
end

set -g MPI_DIR $HOME/.openmpi
set -g PATH $MPI_DIR/bin:$HOME/.openmpi/bin:$PATH
set -g LD_LIBRARY_PATH $MPI_DIR/lib:$HOME/.openmpi/lib:$LD_LIBRARY_PATH
set -g EDITOR vim

alias vi="vim"
alias ls="exa -l"
alias ll="exa -la"
alias cls="clear"
alias py="python3"
