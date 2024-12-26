#! /usr/bin/env bash

URL="https://raw.githubusercontent.com/300degree/dotfiles/main"

success()
{
  printf "\r\033[2K [ \033[00;32mOK\033[0m ] $1\n"
}

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" \
    --unattended --keep-zshrc

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

mkdir -p ~/.config/vim
curl -sfL "$URL/.config/vim/vimrc" -o ~/.config/vim/vimrc
ln -sf ~/.config/vim/vimrc ~/.vimrc
success "Install vimrc"

mkdir -p ~/.config/tmux
curl -sfL "$URL/.config/tmux/tmux.conf" -o ~/.config/tmux/tmux.conf
ln -sf ~/.config/tmux/tmux.conf ~/.tmux.conf
success "Install tmuxconf"

mkdir -p ~/.config/zsh
curl -sfL "$URL/.config/zsh/zshrc" -o ~/.config/zsh/zshrc
ln -sf ~/.config/zsh/zshrc ~/.zshrc
success "Install zshrc"

# mkdir -p ~/.config/git

printf "Done! : Dont forget to run :PlugInstall in VIM and change default SHELL"
