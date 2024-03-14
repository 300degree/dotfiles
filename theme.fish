#! /usr/bin/fish

echo "installing font"
mkdir -p ~/.local/share/fonts
curl -fLO https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/FiraCode.tar.xz
tar -xvf FiraCode.tar.xz -C ~/.local/share/fonts

echo "setup theme"
# omf install neolambda
# omf install bobthefish
