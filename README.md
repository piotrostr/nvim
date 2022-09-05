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

Assuming one has `go` and `npm` installed and in their `$PATH`:

```sh
npm i -g bash-language-server &
  npm i -g dockerfile-language-server-nodejs &
  npm i -g vscode-langservers-extracted

go install github.com/mattn/efm-langserver@latest &
  go install github.com/golangci/golangci-lint/cmd/golangci-lint@v1.42.1 &
  go install github.com/nametake/golangci-lint-langserver@latest
```
