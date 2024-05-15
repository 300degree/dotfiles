#! /bin/bash

echo "Installing oh_my_zsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo "Copying zshrc"
cp .zshrc ~/.zshrc

echo "Copying tmuxconf"
cp .tmux.conf ~/.tmux.conf

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
echo "Copying .vimrc"
cp .vimrc ~/.vimrc

echo "Done! : Dont forget to run :PlugInstall in vim"
