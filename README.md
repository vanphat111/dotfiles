<div align="center">

# 🚀 My Dotfiles

![Arch Linux](https://img.shields.io/badge/Arch_Linux-1793D1?style=for-the-badge&logo=arch-linux&logoColor=white)
![CachyOS](https://img.shields.io/badge/CachyOS-00C0FA?style=for-the-badge&logo=arch-linux&logoColor=black)
![Neovim](https://img.shields.io/badge/NeoVim-%2357A143.svg?&style=for-the-badge&logo=neovim&logoColor=white)
![Tmux](https://img.shields.io/badge/tmux-1BB91F?style=for-the-badge&logo=tmux&logoColor=white)
![Kitty](https://img.shields.io/badge/Kitty-3A3A3A?style=for-the-badge&logo=kitty&logoColor=white)
![Zsh](https://img.shields.io/badge/Zsh-F1502F?style=for-the-badge&logo=zsh&logoColor=white)

**Minimalist • Performance • Productivity**

<img src="https://raw.githubusercontent.com/catppuccin/catppuccin/main/assets/palette/macchiato.png" width="800" />

</div>

---

## 🛠 Tech Stack

| Component | Tool | Description |
|-----------|------|-------------|
| **OS** | [CachyOS](https://cachyos.org/) | Arch-based, optimized for performance. |
| **Terminal** | [Kitty](https://sw.kovidgoyal.net/kitty/) | GPU accelerated, fast, highly customizable. |
| **Shell** | [Zsh](https://www.zsh.org/) | With Fastfetch & FZF integration. |
| **Multiplexer** | [Tmux](https://github.com/tmux/tmux) | Terminal workspace management. |
| **Editor** | [Neovim](https://neovim.io/) | PDE (Personalized Development Environment). |
| **System Info** | [Btop](https://github.com/aristocratos/btop) | Resource monitor. |

## ⚡ Installation

Clone repo này về và chạy script cài đặt tự động (đã bao gồm backup config cũ):

```bash
# 1. Clone về máy
git clone https://github.com/vanphat111/dotfiles.git ~/dotfiles

# 2. Cấp quyền chạy script
chmod +x ~/dotfiles/install.sh

# 3. Chạy script (Tự động symlink)
~/dotfiles/install.sh
