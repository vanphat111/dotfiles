#!/bin/bash

# --- CẤU HÌNH ---
DOTFILES_DIR="$HOME/dotfiles"
BACKUP_DIR="$HOME/dotfiles_backup_$(date +%Y%m%d_%H%M%S)"
LOCALAPP_DIR="$DOTFILES_DIR/.local/share/applications"
HOST_LOCALAPP_DIR="$HOME/.local/share/applications"

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

# 3. Các file trong .local/share/applications
link_config "$LOCALAPP_DIR/1.1.1.1.desktop" "$HOST_LOCALAPP_DIR/1.1.1.1.desktop"
link_config "$LOCALAPP_DIR/warpStatus.desktop" "$HOST_LOCALAPP_DIR/warpStatus.desktop"
link_config "$LOCALAPP_DIR/window.desktop" "$HOST_LOCALAPP_DIR/window.desktop"

# 4. Các folder trong .local/share/applications
link_config "$LOCALAPP_DIR/localIcons" "$HOST_LOCALAPP_DIR/localIcons"
link_config "$LOCALAPP_DIR/localScript" "$HOST_LOCALAPP_DIR/localScript"

echo "=========================================="
echo ">>> XONG! Dotfiles da san sang."
echo ">>> Nho restart shell hoac go: source ~/.zshrc"
