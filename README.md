# neovim

My shared (linux/osx) setup. It uses the built-in neovim lsp and telescope for
file browsing. I would highly recommend this to coc.nvim with netrw, which was
my previous setup, mainly due to speed reasons. 

## Installation

There is a convenience script that performs all of the steps below called
`install.sh` in the root dir. See below for manual installation.

Telescope dependencies:

```sh
sudo apt update && \
  sudo apt install make gcc ripgrep fzf
```

Install packer through:

```sh
git clone \
  --depth 1 \
  https://github.com/wbthomason/packer.nvim \
  ~/.local/share/nvim/site/pack/packer/start/packer.nvim
```

Then install the plugins:

```sh
:PackerCompile
:PackerInstall
```

Optionally, one can also install GitHub Copilot:

```sh
git clone https://github.com/github/copilot.vim.git \
  ~/.vim/pack/github/start/copilot.vim
```

## Language servers

The language servers should be installed automatically thanks to `mason.nvim`
plugin, however in case of any issues they may also be installed manually using
the snippet below.

Assuming one has `go` and `npm` installed and in their `$PATH`:

```sh
npm i -g bash-language-server 
npm i -g dockerfile-language-server-nodejs 
npm i -g vscode-langservers-extracted 
npm i -g yaml-language-server
npm i -g @tailwindcss/language-server
npm i -g solidity-language-server

go install github.com/mattn/efm-langserver@latest 
go install github.com/golangci/golangci-lint/cmd/golangci-lint@latest
go install github.com/nametake/golangci-lint-langserver@latest
go install github.com/hashicorp/terraform-ls@latest
go install github.com/terraform-linters/tflint@latest
```
