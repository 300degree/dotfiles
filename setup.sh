#! /bin/bash

if ! command -v node &>/dev/null; then
  echo "Installing nodejs"
  curl -sL install-node.vercel.app/lts | bash
fi

echo "Installing oh_my_zsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo "Installing vim-plugin"
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo "Copying zshrc"
cp .zshrc ~/.zshrc

echo "Copying tmuxconf"
mkdir ~/.config/tmux
cp .tmux.conf ~/.config/tmux/tmux.conf

echo "Copying .vimrc"
cp .vimrc ~/.vimrc

echo "Done! : Dont forget to run :PlugInstall in vim"
