export HOME=~
export ZSH="$HOME/.oh-my-zsh"

typeset -gU path fpath
typeset -gU ld_lib_path

if command -v vim >/dev/null 2>&1; then
    export EDITOR=vim
fi

export MANPATH=$HOME/.opt/uctags:$MANPATH
export PATH=$HOME/.opt/uctags:$PATH

export C_INCLUDE_PATH=$HOME/.opt/include:$C_INCLUDE_PATH
export LD_LIBRARY_PATH=$HOME/.opt/lib:$LD_LIBRARY_PATH
test -d $HOME/.opt/mpi/man || export MANPATH=$HOME/.opt/mpi/man:$MANPATH
export PATH=$HOME/.opt/mpi/bin:$PATH

