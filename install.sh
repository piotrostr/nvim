#!/bin/bash

sudo apt update && \
  sudo apt install make gcc ripgrep fzf

git clone \
  --depth 1 \
  https://github.com/wbthomason/packer.nvim \
  ~/.local/share/nvim/site/pack/packer/start/packer.nvim

git clone https://github.com/github/copilot.vim.git \
  ~/.config/nvim/pack/github/start/copilot.vim

if which npm >> /dev/null; then
  npm i -g bash-language-server 
  npm i -g dockerfile-language-server-nodejs 
  npm i -g vscode-langservers-extracted 
  npm i -g yaml-language-server
  npm i -g @tailwindcss/language-server
  npm i -g solidity-language-server
  npm i -g typescript-language-server
  npm i -g eslint_d
  npm i -g pyright
else
  echo "NPM executable not found"
fi

if which go >> /dev/null; then
  go install github.com/mattn/efm-langserver@latest 
  go install github.com/golangci/golangci-lint/cmd/golangci-lint@latest
  go install github.com/nametake/golangci-lint-langserver@latest
  go install github.com/hashicorp/terraform-ls@latest
  go install github.com/terraform-linters/tflint@latest
else 
  echo "Go executable not found"
fi
