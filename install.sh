#!/usr/bin/env bash

declare -A colors=(
  ["default"]=`tput sgr 0`
  ["green"]=`tput setaf 2`
  ["cyan"]=`tput setaf 6`)

INSTALL_DIR=$HOME/.local/share/dotfiles

echo "${colors[cyan]}=> Installing plugin managers...${colors[default]}"
command curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
command curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh

echo "${colors[cyan]}=> Downloading dotfiles from git to '$INSTALL_DIR'...${colors[default]}"
command git -c advice.detachedHead=false clone --recursive \
        https://github.com/gponsu/dotfiles.git --depth=1 "${INSTALL_DIR}"

echo "${colors[cyan]}=> Creating symbolic links to configuration files...${colors[default]}"
command ln -vsf $INSTALL_DIR/vimrc.conf $HOME/.config/nvim/init.vim
command ln -vsf $INSTALL_DIR/zshrc.conf $HOME/.zshrc

echo "${colors[green]}=> ✔ Completed, enjoy!${colors[default]}"
