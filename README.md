# neovim

My shared (linux/osx) setup.

## Installation

Install packer through:

```sh
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
```

Then to install the plugins:

```sh
:PackerCompile
:PackerInstall
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

go install github.com/mattn/efm-langserver@latest 
go install github.com/golangci/golangci-lint/cmd/golangci-lint@latest
go install github.com/nametake/golangci-lint-langserver@latest
go install github.com/hashicorp/terraform-ls@latest
go install github.com/terraform-linters/tflint@latest
```
