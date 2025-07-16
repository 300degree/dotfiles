export HOME=~
export ZSH="$HOME/.oh-my-zsh"

typeset -gU path fpath
typeset -gU ld_lib_path

if command -v vim >/dev/null 2>&1; then
    export EDITOR=vim
fi

# Set the list of directories that Zsh searches for programs.
path=(
    /usr/local/{bin,sbin}
    /usr/{bin,sbin}
    /{bin,sbin}
    $HOME/.local/{bin,sbin}
    $HOME/local/{bin,sbin}
    $HOME/.opt/{bin,sbin}
    $HOME/opt/{bin,sbin}
    $HOME/{bin,sbin}
    $path
)

# Set the list of directories that Zsh searches for libraries.
ld_lib_path=(
    $HOME/.local/{lib,lib64}
    $HOME/local/{lib,lib64}
    $HOME/.opt/{lib,lib64}
    $HOME/opt/{lib,lib64}
    ${(s/:/)LD_LIBRARY_PATH}
)

export LD_LIBRARY_PATH="${(j/:/)ld_lib_path}"
