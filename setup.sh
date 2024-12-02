#! /bin/bash

ZSHRC_PROFILE="https://raw.githubusercontent.com/300degree/dotfiles/refs/heads/main/.zshrc_kit_profile"
TMUXCONF_URL="https://raw.githubusercontent.com/300degree/dotfiles/refs/heads/main/.tmux.conf"
VIMCONF_URL="https://raw.githubusercontent.com/300degree/dotfiles/refs/heads/main/.vimrc"

detect_vim_type() {
    if command -v nvim >/dev/null 2>&1; then
        echo "nvim"
    else
        echo "vim"
    fi
}

install_node() {
    if ! command -v node &>/dev/null; then
		echo "Installing nodejs"
		mkdir -p $HOME/.nodejs
		curl -sL install-node.vercel.app/lts | bash -s -- --prefix=$HOME/.nodejs
    fi
}

install_fzf() {
    echo "Installing fzf"
    git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
    ~/.fzf/install
}

install_omz() {
    echo "Installing oh_my_zsh"
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
}

install_vim_plugin() {
    local vim_type=$(detect_vim_type)
    local plug_path

    if [[ "$vim_type" == "nvim" ]]; then
        plug_path="${XDG_DATA_HOME:-$HOME/.local/share}/nvim/site/autoload/plug.vim"
    else
        plug_path="$HOME/.vim/autoload/plug.vim"
    fi

    echo "Installing vim-plugin"
    curl -fLo "$plug_path" --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
}

create_tmuxconf() {
    echo "Creating tmuxconf"
    curl -sfL \
        "$TMUXCONF_URL" -o \
        "$HOME/Documents/setup-dotfile/tmux.conf"
}

create_vimconf() {
    local vim_type=$(detect_vim_type)
    local config_path
    local config_file

    if [[ "$vim_type" == "nvim" ]]; then
        config_file="init.vim"
        config_path="$HOME/.config/nvim"
        mkdir -p "$config_path"
    else
        config_file=".vimrc"
        config_path="$HOME"
    fi

    echo "Creating vimrc or init.vim"
    curl -sfL \
        "$VIMCONF_URL" -o \
        "$config_path/$config_file"
}

added_profile() {
    curl -sfL \
        "$ZSHRC_PROFILE" -o \
        "$HOME/.zshrc_kit_profile"

    if grep -q "^ZSH_THEME=" $HOME/.zshrc; then
        sed -i 's/^ZSH_THEME=.*/ZSH_THEME="half-life"/' $HOME/.zshrc
    else
        echo 'ZSH_THEME="half-life"' >> $HOME/.zshrc
    fi
    echo "source $HOME/.zshrc_kit_profile"
    echo "ZSH_PROFILE added successfully."
}

detect_vim_type
install_node
install_fzf
install_omz
install_vim_plugin
create_tmuxconf
create_vimconf
added_profile

echo "Done! : Dont forget to run :PlugInstall in vim or neovim"