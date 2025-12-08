#!/bin/bash

# --- CẤU HÌNH ---
DOTFILES_DIR="$HOME/dotfiles"
BACKUP_DIR="$HOME/dotfiles_backup_$(date +%Y%m%d_%H%M%S)"

echo ">>> Bat dau setup dotfiles..."
echo ">>> Config cu se duoc backup tai: $BACKUP_DIR"
mkdir -p "$BACKUP_DIR"

# Hàm tạo symlink an toàn
link_config() {
  src="$1"
  dest="$2"

  echo "--- Xu ly: $dest"

  # Nếu đích đã có file/folder thật (không phải symlink), thì move vào backup
  if [ -e "$dest" ] && [ ! -L "$dest" ]; then
    echo "    Backup config cu..."
    mv "$dest" "$BACKUP_DIR/"
  fi

  # Nếu là symlink cũ thì xóa đi
  if [ -L "$dest" ]; then
    rm "$dest"
  fi

  # Tạo folder cha nếu chưa có (ví dụ .config)
  mkdir -p "$(dirname "$dest")"

  # Tạo symlink mới
  ln -sf "$src" "$dest"
  echo "    Da link: $src -> $dest"
}

# ====================================================
# DANH SÁCH FILE CẦN LINK (Dựa trên dotfiles.txt của mày)
# ====================================================

# 1. Các file nằm ngay ở Home
link_config "$DOTFILES_DIR/.zshrc" "$HOME/.zshrc"
link_config "$DOTFILES_DIR/.tmux.conf" "$HOME/.tmux.conf"
link_config "$DOTFILES_DIR/.gitconfig" "$HOME/.gitconfig"

# 2. Các folder nằm trong .config
link_config "$DOTFILES_DIR/.config/nvim" "$HOME/.config/nvim"
link_config "$DOTFILES_DIR/.config/kitty" "$HOME/.config/kitty"
link_config "$DOTFILES_DIR/.config/fastfetch" "$HOME/.config/fastfetch"
link_config "$DOTFILES_DIR/.config/btop" "$HOME/.config/btop"

echo "=========================================="
echo ">>> XONG! Dotfiles da san sang."
echo ">>> Nho restart shell hoac go: source ~/.zshrc"
