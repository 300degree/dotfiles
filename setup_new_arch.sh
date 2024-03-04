#! /usr/bin/bash

install_tools() {
    echo -e "\nInstalling tools..."
    sudo pacman -Syu \
        neovim tmux fish exa yay git neofetch \
        nodejs npm pnpm \
        ttf-firacode-nerd

    echo "[*] Install oh-my-fish & theme"
    curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install | fish
    omf install neolambda

    echo "[*] Install tmp"
    git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm
}

copy_config() {
    echo -e "\nCopying configs..."
    echo "[*] Copying fishconf"
    cp ./.config/fish ~/.config/fish
    source ~/.config/fish/conf.fish

    echo "[*] Copying neofetch"
    cp ./.config/neofetch/ ~/.config/neofetch/

    echo "[*] Copying neovim"
    cp ./.config/nvim ~/.config/nvim

    echo "[*] Copying tmuxconf"
    cp ./.config/tmux/tmux.conf ~/.config/tmux
    source ~/.config/tmux/tmux.conf
}

install_tools
copy_config
