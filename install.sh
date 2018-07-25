#!/usr/bin/env bash

INSTALL_DIR=$HOME/.dotfiles

echo "=> Installing plugin managers..."
command curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim &> /dev/null
command curl -fLo ~/.antigen/antigen.zsh --create-dirs git.io/antigen &> /dev/null
command git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm &> /dev/null


echo "=> Downloading dotfiles from git to '$INSTALL_DIR'"
command git -c advice.detachedHead=false clone --recursive \
        https://github.com/gponsu/dotfiles.git --depth=1 "${INSTALL_DIR}" &> /dev/null

echo "=> Installing..."
command ln -sf $INSTALL_DIR/vimrc.conf $HOME/.vimrc
command ln -sf $INSTALL_DIR/tmux.conf $HOME/.tmux.conf
command ln -sf $INSTALL_DIR/zshrc.conf $HOME/.zshrc

echo "=> Completed, enjoy!"
