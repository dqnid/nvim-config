# 💤 LazyVim

A starter template for [LazyVim](https://github.com/LazyVim/LazyVim).
Refer to the [documentation](https://lazyvim.github.io/installation) to get started.

## Install these:

- `$ npm i -g vscode-langservers-extracted`
- `# pacman -S lazygit`

## TODO

- bufferline:
  - close icon on hover
  - name format
- nvim-lint:
  - check if necessary to specify linter by lang

## TO-CHECK

- indent-blankline: changes not being applied (if not success remove)

## General mappings

### leader

#### g

`g` stands for go-to or git.

- `g`


#### b

b stands for buffer

- `bpx`: pick one to close
- `box`: close all but current

#### w

w stands for workspace

- `<leader>wa` : Add workspace folder
- `<leader>wr` : remove workspace folder
- `<leader>wl` : list workspace folders

#### t

`t` stands for terminal

#### ctrl

move focus

#### shift

move content

#### alt

move content

#### `][`

Move whatever

- `]b` : go to next buffer
- `[b` : go to prev buffer


## Obscure Mappings

- `s` : flash find.
- `S` : flash find based on `treesitter`.
