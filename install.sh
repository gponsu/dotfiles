#!/usr/bin/env bash

declare -A colors=(
  ["default"]=`tput sgr 0`
  ["green"]=`tput setaf 2`
  ["cyan"]=`tput setaf 6`)

INSTALL_DIR=$HOME/.dotfiles

echo "${colors[cyan]}=> Installing plugin managers...${colors[default]}"
command curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
command curl -fLo ~/.antigen/antigen.zsh --create-dirs git.io/antigen
command git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm


echo "${colors[cyan]}=> Downloading dotfiles from git to '$INSTALL_DIR'...${colors[default]}"
command git -c advice.detachedHead=false clone --recursive \
        https://github.com/gponsu/dotfiles.git --depth=1 "${INSTALL_DIR}"

echo "${colors[cyan]}=> Creating symbolic links to configuration files...${colors[default]}"
command ln -vsf $INSTALL_DIR/vimrc.conf $HOME/.vimrc
command ln -vsf $INSTALL_DIR/tmux.conf $HOME/.tmux.conf
command ln -vsf $INSTALL_DIR/zshrc.conf $HOME/.zshrc

echo "${colors[green]}=> ✔ Completed, enjoy!${colors[default]}"
