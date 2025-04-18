#! /usr/bin/env bash
set -e

URL="https://raw.githubusercontent.com/300degree/dotfiles/main"
BIN_PREFIX=~/.local/bin

mkdir -p ~/.vim/autoload
mkdir -p $BIN_PREFIX

[ ! -d ~/.oh-my-zsh ] && sh -c "$(wget -O-                                     \
  https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"  \
  "" --unattended

[ ! -f ~/.vim/autoload/plug.vim ] && wget -O ~/.vim/autoload/plug.vim -q       \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

[ ! -f ~/.vimrc ] && wget -O ~/.vimrc -q "$URL/.vimrc" 
[ ! -f ~/.gitconfig ] && wget -O ~/.gitconfig -q "$URL/.gitconfig"
[ ! -f ~/.tmux.conf ] && wget -O ~/.tmux.conf -q "$URL/.tmux.conf"
[ -f ~/.zshrc ] && mv ~/.zshrc ~/.zshrc.bck && \
  wget -O ~/.zshrc -q "$URL/.zshrc" 

fzf_script=("git-commit-explore" "git-branch-explore" "vim-explore")
for out in "${fzf_script[@]}"
do
  wget -O $BIN_PREFIX/$out -q "$URL/bin/$out"
  if [ -f $BIN_PREFIX/$out ]; then
    chmod +x ~/.local/bin/$out
  fi
done

echo "Done!"
echo "Dont forget to run :PlugInstall in VIM and change default SHELL"
