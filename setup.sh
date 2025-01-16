#! /usr/bin/env bash

URL="https://raw.githubusercontent.com/300degree/dotfiles/main"

success()
{
  printf "\r\033[2K [ \033[00;32mOK\033[0m ] $1\n"
}

failure()
{
  printf "\r\033[2K [ \033[00;31mFAIL\033[0m ] $1\n"
}

download()
{
    if curl -sfL "$1" -o "$2"; then
        success "$3"
    else
        failure "$3"
        exit 1
    fi
}

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" \
    --unattended --keep-zshrc

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

mkdir -p ~/.config/vim
download "$URL/.config/vim/vimrc" ~/.config/vim/vimrc "Install vimrc"
ln -sf ~/.config/vim/vimrc ~/.vimrc

mkdir -p ~/.config/tmux
download "$URL/.config/tmux/tmux.conf" ~/.config/tmux/tmux.conf "Install tmux.conf"
ln -sf ~/.config/tmux/tmux.conf ~/.tmux.conf

mkdir -p ~/.config/zsh
download "$URL/.config/zsh/zshrc" ~/.config/zsh/zshrc "Install zshrc"
ln -sf ~/.config/zsh/zshrc ~/.zshrc

mkdir -p ~/.config/git
download "$URL/.config/git/config" ~/.config/git/config "Install gitconfig"
download "$URL/.config/git/ignore" ~/.config/git/ignore "Install gitignore"

printf "Done! : Dont forget to run :PlugInstall in VIM and change default SHELL\n"
