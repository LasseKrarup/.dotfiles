# Dotfiles

This repository contains my personal dotfiles.

## Installation

### Often used programs

To install some of my most used programs:

#### Ubuntu

```shell
sudo apt update && sudo apt install \
    git \
    stow \
    tmux \
    ripgrep \
    fd-find \
    fzf \
    wget \
    tree \
```

##### Neovim nightly

```shell
wget https://github.com/neovim/neovim/releases/download/nightly/nvim-linux-x86_64.tar.gz && \
tar xzvf nvim-linux-x86_64.tar.gz && \
mkdir -p ~/.local && \
cp -r nvim-linux-x86_64/* ~/.local && \
rm -r nvim-linux-x64_64*
```

##### Brew

```shell
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

##### Starship

```shell
curl -sS https://starship.rs/install.sh | sh
```

##### Oh My Posh

```shell
curl -s https://ohmyposh.dev/install.sh | bash -s
```

##### Brew packages

```shell
brew install nushell
```

### The dotfiles

Below snippet requires `stow`

```shell
git clone https://github.com/LasseKrarup/.dotfiles.git ~/.dotfiles
cd ~/.dotfiles
stow .
```
