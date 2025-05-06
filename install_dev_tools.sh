#!/bin/bash

# Define packages to install
PACKAGES="git curl wget htop ripgrep fzf fd-find unzip tmux"

# Check if sudo is available
if command -v sudo &>/dev/null; then
  SUDO="sudo"
else
  SUDO=""
fi

echo "Installing apt packages: $PACKAGES"

# Install packages
if [ ! -d /var/lib/apt/lists ] || [ -z "$(ls -A /var/lib/apt/lists 2>/dev/null)" ]; then
  $SUDO apt-get update
fi
$SUDO apt-get install -y --no-install-recommends $PACKAGES

APT_EXIT=$?

# Check installation status
if [ $APT_EXIT -eq 0 ]; then
  echo "Successfully installed: $PACKAGES"
else
  echo "Failed to install some apt packages"
fi

# Ensure ~/.local/bin exists
mkdir -p ~/.local/bin

# Symlink fdfind to fd
if [ ! -f ~/.local/bin/fd ]; then
  echo "Creating symlink for fdfind..."
  ln -s /usr/bin/fdfind ~/.local/bin/fd
fi

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
  eval "$($HOME/.local/bin/fnm env)"
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

# ── KEEP AT THE END OF SCRIPT ─────────────────────────────────────────
# Source .bashrc
source ~/.bashrc
