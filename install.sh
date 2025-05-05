#!/bin/bash

if [ ! command -v foobar ] &>/dev/null; then
  # Install Stow
  echo "Stow not found. Attempting to install..."

  # Check if sudo is available
  if command -v sudo &>/dev/null; then
    SUDO="sudo"
  else
    SUDO=""
  fi

  $SUDO apt-get install stow
fi

if [ -f ~/.bashrc ]; then
  echo "Moving existing .bashrc to .bashrc.bak"
  mv ~/.bashrc ~/.bashrc.bak
fi

stow .
