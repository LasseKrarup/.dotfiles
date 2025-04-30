# 💤 LazyVim

A starter template for [LazyVim](https://github.com/LazyVim/LazyVim).
Refer to the [documentation](https://lazyvim.github.io/installation) to get started.

## Installation

### NeoVim and prerequisites - WSL

```
wsl --install
wsl
sudo add-apt-repository ppa:neovim-ppa/unstable -y
sudo apt update
sudo apt install make gcc ripgrep unzip git xclip fzf fd-find lazygit neovim
```

### NeoVim and prerequisites - Windows Choco

```
choco install -y neovim git ripgrep wget unzip gzip mingw make lazygit fd fzf
```

### Config - WSL

1. Save old conf as backup

```
# required
mv ~/.config/nvim{,.bak}

# optional but recommended
mv ~/.local/share/nvim{,.bak}
mv ~/.local/state/nvim{,.bak}
mv ~/.cache/nvim{,.bak}
```

2. Clone

```
git clone https://github.com/LasseKrarup/nvimconfig ~/.config/nvim
```

### Config - Windows PowerShell

1. Save old conf as backup

```
# required
Move-Item $env:LOCALAPPDATA\nvim $env:LOCALAPPDATA\nvim.bak

# optional but recommended
Move-Item $env:LOCALAPPDATA\nvim-data $env:LOCALAPPDATA\nvim-data.bak
```

2. Clone

```
git clone https://github.com/LasseKrarup/nvimconfig $env:LOCALAPPDATA\nvim
```
