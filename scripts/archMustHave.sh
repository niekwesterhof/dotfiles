#!/usr/bin/env bash
set -euo pipefail

echo "🚀 Installing development environment on Arch Linux..."

# --- 1. Ensure system is up to date ---
echo "📦 Updating system..."
sudo pacman -Syu --noconfirm

# --- 2. Install git first ---
echo "🔧 Installing git..."
sudo pacman -S --needed --noconfirm git

# --- 3. Install base packages ---
echo "📦 Installing nodejs, npm, fzf, zoxide..."
sudo pacman -S --needed --noconfirm nodejs npm fzf zoxide bat tmux ripgrep lazygit neovim

echo "📥 Installing core development tools..."
sudo pacman -S --noconfirm --needed \
  git \
  python python-pip python-pipx

# --- 4. Install yazi (file manager) ---
echo "📂 Installing yazi..."
sudo pacman -S --needed --noconfirm yazi

# --- 5. Install starship (prompt) ---
echo "✨ Installing starship..."
sudo pacman -S --needed --noconfirm starship

# --- 6. Install atuin (history manager) ---
echo "🕒 Installing atuin..."
sudo pacman -S --needed --noconfirm atuin

# --- 7. Install pyright (via npm) ---
echo "🐍 Installing pyright..."
sudo npm install -g pyright

# Ensure OpenSSH server is installed
if ! command -v sshd >/dev/null 2>&1; then
  echo "Installing OpenSSH server..."
  sudo pacman -S --noconfirm openssh # (Arch Linux)
  # On Debian/Ubuntu: sudo apt install -y openssh-server
fi

# Enable and start the sshd service
echo "Enabling and starting sshd..."
sudo systemctl enable sshd
sudo systemctl start sshd

# Update sshd_config to allow password login (optional)
# WARNING: safer to use SSH keys, but this enables password logins
sudo sed -i 's/^#\?PasswordAuthentication.*/PasswordAuthentication yes/' /etc/ssh/sshd_config
sudo sed -i 's/^#\?PermitRootLogin.*/PermitRootLogin prohibit-password/' /etc/ssh/sshd_config

# Restart sshd to apply changes
echo "Restarting sshd..."
sudo systemctl restart sshd

echo "✅ SSH is now set to accept logins"

echo " Finishing up:"

if [ ! -f "$HOME/.bash-preexec.sh" ]; then
  echo "~/.bash-preexec not found, installing..."
  curl -fsSL https://raw.githubusercontent.com/rcaloras/bash-preexec/master/bash-preexec.sh -o "$HOME/.bash-preexec.sh"
else
  echo "~/.bash-preexec already exists ✅"
fi

if [ ! -d "$HOME/.tmux/plugins/tpm/" ]; then
  echo "~/.tmux/plugins/tpm not found, installing..."
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
  tmux
  tmux source-file ~/.tmux.conf
  ~/.tmux/plugins/tpm/bin/install_plugins
else
  echo "~/.tmux/plugins/tpm/ already exists ✅"
fi

echo
echo "✅ All tools installed!"
echo
echo "👉 Next steps:"
echo "   - Add 'eval \"\$(starship init bash)\"' to ~/.bashrc or ~/.zshrc"
echo "   - Add 'eval \"\$(zoxide init bash)\"' to ~/.bashrc or ~/.zshrc"
echo "   - Run 'atuin import auto' and 'atuin init bash' to enable history sync"

atuin import auto
