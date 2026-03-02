#!/bin/bash

DOTFILES="$HOME/dotfiles"
CONFIG_DIR="$HOME/.config"

echo "🔗 Skapar symlänkar..."

# Ensure the base .config directory exists
mkdir -p "$CONFIG_DIR"

# 1. Standalone home directory files
echo "📄 Linking home directory files..."
ln -sf "$DOTFILES/.zshrc" "$HOME/.zshrc"
ln -sf "$DOTFILES/.gitconfig" "$HOME/.gitconfig"

# 2. Loop through everything in dotfiles/.config/
echo "📂 Linking .config directories..."
for app_path in "$DOTFILES/.config/"*; do
	[ -e "$app_path" ] || continue
	app_name=$(basename "$app_path")
	target_path="$CONFIG_DIR/$app_name"

	if [ -e "$target_path" ] && [ ! -L "$target_path" ]; then
		echo "   ⚠️  Existing $app_name found. Backing up to $app_name.bak..."
		mv "$target_path" "${target_path}.bak"
	fi

	ln -sfn "$app_path" "$target_path"
	echo "   -> Linked $app_name"
done

# 3. Fix Helix Runtime Link (Crucial for WSL2 health)
if [ -d "$HOME/.helix-src/runtime" ]; then
	echo "🛠️  Setting up Helix runtime symlink..."
	ln -sfn "$HOME/.helix-src/runtime" "$CONFIG_DIR/helix/runtime"
fi

# 4. 🕵️ Dependency Check (The "Install Everything" logic)
echo -e "\n🔍 Checking Helix Dependencies..."
deps=("node" "npm" "rust-analyzer" "pyright" "ruff" "gopls" "marksman" "prettierd" "shfmt" "taplo")

missing=()
for tool in "${deps[@]}"; do
	if ! command -v "$tool" &>/dev/null; then
		missing+=("$tool")
	fi
done

if [ ${#missing[@]} -eq 0 ]; then
	echo "✅ All dependencies installed!"
else
	echo "❌ Missing tools: ${missing[*]}"
	echo "💡 Run the following to fix the most common ones:"
	echo "   sudo apt install shfmt"
	echo "   npm install -g pyright @fsouza/prettierd @biomejs/biome vscode-langservers-extracted"
fi

echo -e "\n✅ Klar!"
