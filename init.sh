#!/bin/bash

if [ ! `id -u` -ne 0 ]; then
  echo "Please run on not root"
  exit 1
fi
set -e

sudo apt update
sudo apt upgrade

#ツールインストール
sudo apt install -y tree docker.io docker-compose sipcalc jq traceroute bat iperf3 mtr fzf

# 重いツール TODO 選択制にする
sudo apt install -y ffmpeg

# TODO 手動インストールのツールのバーしょん決め打ちするな


# lsd install
wget https://github.com/lsd-rs/lsd/releases/download/0.23.0/lsd-musl_0.23.0_amd64.deb
sudo dpkg -i lsd-musl_0.23.0_amd64.deb
rm lsd-musl_0.23.0_amd64.deb

# hugo
wget https://github.com/gohugoio/hugo/releases/download/v0.119.0/hugo_extended_0.119.0_linux-amd64.deb
sudo dpkg -i hugo_extended_0.119.0_linux-amd64.deb
rm hugo_extended_0.119.0_linux-amd64.deb

# minikube
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube_latest_amd64.deb
sudo dpkg -i minikube_latest_amd64.deb
rm minikube_latest_amd64.deb

# ansible
sudo apt-add-repository --yes --update ppa:ansible/ansible
sudo apt install -y ansible

# neovim

sudo curl https://github.com/neovim/neovim/releases/latest/download/nvim.appimage \
      -Lo /usr/local/bin/nvim --create-dirs
sudo chmod a+x /usr/local/bin/nvim

## vim-plug
curl -fLo ~/.var/app/io.neovim.nvim/data/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# lazygit
LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
tar xf lazygit.tar.gz lazygit
sudo install lazygit /usr/local/bin
rm lazygit.tar.gz lazygit

# gh
type -p curl >/dev/null || (sudo apt update && sudo apt install curl -y)
curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg \
&& sudo chmod go+r /usr/share/keyrings/githubcli-archive-keyring.gpg \
&& echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null \
&& sudo apt update \
&& sudo apt install gh -y

# nodejs(20.x)
curl -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash - &&\
sudo apt-get install -y nodejs

#依存インストール
sudo apt install -y zsh cargo libssl-dev pkg-config trash-cli
cargo install sheldon

#セットアップ
sudo usermod -aG docker masetaiyo
chsh -s $(which zsh)
~/.cargo/bin/sheldon init --shell zsh
