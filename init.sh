#!/bin/bash
#ツールインストール
apt install -y tree
#依存インストール
apt install -y zsh cargo libssl-dev pkg-config
cargo install sheldon
#セットアップ
chsh -s $(which zsh)
~/.cargo/bin/sheldon init --shell zsh
