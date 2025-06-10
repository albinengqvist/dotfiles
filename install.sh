#!/bin/bash

echo "🔗 Skapar symlänkar..."

# ZSH
ln -sf "$HOME/dotfiles/.zshrc" "$HOME/.zshrc"

# Helix config
mkdir -p "$HOME/.config"
ln -sfn "$HOME/dotfiles/.config/helix" "$HOME/.config/helix"

# Lägg till fler configs här:
# ln -sfn "$HOME/dotfiles/.config/eza" "$HOME/.config/eza"
ln -sf "$HOME/dotfiles/.gitconfig" "$HOME/.gitconfig"
echo "✅ Klar!"
