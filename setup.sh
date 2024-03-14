#! /usr/bin/bash

install_tools() {
    echo -e "\nInstalling tools..."
    echo "[*] Install oh-my-fish & theme"
    curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install | fish
    fish ./script/theme.fish

    echo "[*] Install tmp"
    git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm
}

copy_config() {
    echo -e "\nCopying configs..."
    echo "[*] Copying neovim"
    cp -r .config/nvim ~/.config/nvim

    echo "[*] Copying tmuxconf"
    cp -r .config/tmux/tmux.conf ~/.config/tmux/

    echo "[*] Copying fishconf"
    cp -r .config/fish/config.fish ~/.config/fish/
}

install_tools
copy_config

echo "[*] Changing default shell"
chsh -s "$(which fish)"
echo -e "\e[1;92mDONE!\e[0m, Dont forgot to run prefix + I in tmux"
