#! /usr/bin/env bash

URL="https://raw.githubusercontent.com/300degree/dotfiles/main"

[ ! -d ~/.oh-my-zsh ] && sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" \
    --unattended --keep-zshrc

[ ! -f ~/.vim/autoload/plug.vim ] && curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# printf "Install vimrc\n"
[ ! -f ~/.vimrc ] && curl -sfL "$URL/.config/vim/vimrc" -o ~/.vimrc

# printf "Install .tmux.conf\n"
[ ! -f ~/.tmux.conf ] && curl -sfL "$URL/.config/tmux/tmux.conf" -o ~/.tmux.conf

# printf "Install .zshrc\n"
[ ! -f ~/.zshrc ] &&
curl -sfL "$URL/.config/zsh/zshrc" -o ~/.zshrc

# printf "Install .gitconfig\n"
[ ! -f ~/.gitconfig ] && curl -sfL "$URL/.config/git/config" -o ~/.gitconfig
[ ! -f ~/.gitignore ] && curl -sfL "$URL/.config/git/ignore" -o ~/.gitignore

# printf "Install .clang-format"
curl -sfL "$URL/.clang-format" -o ~/.clang-format

# dotfile log and etc [TODO]
mkdir -p ~/.local/bin
[ ! -f ~/.local/bin/df-log ] && curl -sfL "$URL/.local/bin/df-log" -o ~/.local/bin/df-log
# [ ! -f ~/.local/bin/df- ] && curl -sfL "$URL/.local/bin/df-" -o ~/.local/bin/df-

printf "Done! : Dont forget to run :PlugInstall in VIM and change default SHELL\n"
