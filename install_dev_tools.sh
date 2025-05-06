#!/bin/bash

# Define packages to install
PACKAGES="git curl wget htop ripgrep fzf fd-find unzip"

# Check if sudo is available
if command -v sudo &>/dev/null; then
  SUDO="sudo"
else
  SUDO=""
fi

echo "Installing apt packages: $PACKAGES"

# Install packages
$SUDO apt-get update
$SUDO apt-get install -y --no-install-recommends $PACKAGES
$SUDO rm -rf /var/lib/apt/lists/*

APT_EXIT=$?

# Check installation status
if [ $APT_EXIT -eq 0 ]; then
  echo "Successfully installed: $PACKAGES"
else
  echo "Failed to install some apt packages"
fi

# Ensure ~/.local/bin exists
mkdir -p ~/.local/bin

# Symlink fd-find to fd
ln -s /usr/bin/fdfind ~/.local/bin/fd

# Install Starship
if ! command -v starship &>/dev/null; then
  echo "Installing Starship..."
  curl -sS https://starship.rs/install.sh | sh
fi

# Node for LSP's
# Download and install fnm:
if ! command -v node &>/dev/null; then
  echo "Installing Node.js using fnm..."
  curl -fsSL https://fnm.vercel.app/install | bash -s -- --install-dir "$HOME/.local/bin" --skip-shell
  eval "$(fnm env)"
  fnm install 22
fi

if ! command -v nvim &>/dev/null; then
  echo "Installing Neovim..."
  curl -L https://github.com/neovim/neovim/releases/download/nightly/nvim-linux-x86_64.tar.gz | tar xzf -
  cp -r nvim-linux-x86_64/* ~/.local
  rm -r nvim-linux-x86_64*
fi

if ! command -v lazygit &>/dev/null; then
  echo "Installing Lazygit..."
  LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | \grep -Po '"tag_name": *"v\K[^"]*')
  curl -L https://github.com/jesseduffield/lazygit/releases/download/v${LAZYGIT_VERSION}/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz | tar xzf -
  install lazygit -D -t $HOME/.local/bin
  rm lazygit -r
fi
