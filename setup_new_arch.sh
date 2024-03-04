#! /usr/bin/bash

install_tools() {
    echo -e "\nInstalling tools..."
    sudo pacman -Syu \
        neovim tmux fish exa git neofetch \
        nodejs npm pnpm \
        ttf-firacode-nerd

    echo "[*] Install oh-my-fish & theme"
    curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install
    cp -r ./theme/neolambda ~/.local/share/omf/themes

    echo "[*] Install tmp"
    git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm
}

copy_config() {
    echo -e "\nCopying configs..."
    echo "[*] Copying neofetch"
    cp -r .config/neofetch/ ~/.config/

    echo "[*] Copying neovim"
    cp -r ./.config/nvim ~/.config/nvim

    echo "[*] Copying tmuxconf"
    cp -r ./.config/tmux/tmux.conf ~/.config/tmux

    echo "[*] Copying fishconf"
    cp -r .config/fish/ ~/.config/fish
}

install_tools
copy_config

echo "[*] Changing default shell"
chsh -s "$(which fish)" | fish
