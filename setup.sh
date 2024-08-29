#! /bin/bash

if ! command -v node &>/dev/null; then
  echo "Installing nodejs"
  mkdir -p $HOME/.nodejs
  curl -sL install-node.vercel.app/lts | bash -s -- --prefix=$HOME/.nodejs
fi

echo "Installing fzf"
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

echo "Installing oh_my_zsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo "Installing vim-plugin"
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo "Copying zshrc"
cp .zshrc ~/.zshrc

echo "Copying tmuxconf"
mkdir -p ~/.config/tmux
cp .tmux.conf ~/.config/tmux/tmux.conf

echo "Copying .vimrc"
cp .vimrc ~/.vimrc

echo "Done! : Dont forget to run :PlugInstall in vim"
