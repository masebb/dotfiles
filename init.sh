#!/bin/bash

if [ `id -u` -ne 0 ]; then
  echo "Please run on root"
  exit 1
fi
set -e

apt update
apt upgrade
#ツールインストール
apt install -y tree docker.io docker-compose sipcalc jq traceroute bat
# 重いツール TODO 選択制にする
apt install -y ffmpeg
#lsd
wget https://github.com/lsd-rs/lsd/releases/download/0.23.0/lsd-musl_0.23.0_amd64.deb
dpkg -i lsd_0.23.1_amd64.deb
rm lsd_0.23.1_amd64.deb
# hugo
wget https://github.com/gohugoio/hugo/releases/download/v0.111.3/hugo_extended_0.111.3_linux-amd64.deb
sudo dpkg -i hugo_extended_0.111.3_linux-amd64.deb
# minikube
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube_latest_amd64.deb
sudo dpkg -i minikube_latest_amd64.deb
# neovim
add-apt-repository ppa:neovim-ppa/stable
apt-get update
apt-get install neovim
# lazygit
LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
tar xf lazygit.tar.gz lazygit
install lazygit /usr/local/bin
# ghインストール
type -p curl >/dev/null || (sudo apt update && sudo apt install curl -y)
curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg \
&& sudo chmod go+r /usr/share/keyrings/githubcli-archive-keyring.gpg \
&& echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null \
&& sudo apt update \
&& sudo apt install gh -y
#依存インストール
apt install -y zsh cargo libssl-dev pkg-config trash-cli
cargo install sheldon
#セットアップ
chsh -s $(which zsh)
~/.cargo/bin/sheldon init --shell zsh
