#! /bin/bash

echo "Installing oh_my_zsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo "Copying zshrc"
cp .zshrc ~/.zshrc

echo "Copying tmuxconf"
cp .tmux.conf ~/.tmux.conf

if command -v nvim &>/dev/null; then
  sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  echo "Copying init.vim"
  cp init.vim ~/.config/nvim/init.vim

elif command -v vim &>/dev/null; then
  curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  echo "Copying .vimrc"
  cp init.vim ~/.vimrc

else
  echo "you dont have vim and neovim"
fi

echo "Done! : Dont forget to run :PlugInstall in vim"
