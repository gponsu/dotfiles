#!/usr/bin/env bash

INSTALL_DIR=$HOME/.dotfiles

echo "=> Downloading dotfiles from git to '$INSTALL_DIR'"
command git -c advice.detachedHead=false clone --recursive git@github.com:gponsu/dotfiles.git --depth=1 "${INSTALL_DIR}" &> /dev/null

echo "=> Installing..."
command ln -sf $INSTALL_DIR/vimrc.conf $HOME/.config/nvim/init.vim
command ln -sf $INSTALL_DIR/tmux.conf $HOME/.tmux.conf
command ln -sf $INSTALL_DIR/zshrc.conf $HOME/.zshrc

echo "=> Completed, enjoy!"
