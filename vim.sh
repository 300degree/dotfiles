#! /bin/bash

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo "[*] Install oh-my-fish"
curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install | fish

echo "Copying .vimrc"
cp .vimrc ~/.vimrc

echo "Copying .tmuxconf"
cp .tmux.conf ~/.tmux.conf

echo "Done! : Dont forget to run :PlugInstall in vim"
