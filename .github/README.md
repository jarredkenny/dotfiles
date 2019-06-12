# Dotfiles

## Setup

### Install

```bash
git clone --bare git@github.com:jarredkenny/dotfiles.git $HOME/.dotfiles && \
git --git-dir=$HOME/.dotfiles --work-tree=$HOME checkout && \
$HOME/.env/bootstrap && \
source $HOME/.env/source
```

Upon installation are environment tools will be bootstrapped and the new zsh config is sourced.

### Usage

A `config` alias is supplied and can be used to manage dotfiles.
