# Upgrade current packages
sudo apt update && sudo apt upgrade -y

# Go repo
# https://launchpad.net/~longsleep/+archive/ubuntu/golang-backports
sudo add-apt-repository ppa:longsleep/golang-backports

# Python repo
# https://launchpad.net/~deadsnakes/+archive/ubuntu/ppa
sudo add-apt-repository ppa:deadsnakes/ppa

# Node repo
# https://nodejs.org/en/download/package-manager
# installs NVM (Node Version Manager)
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.0/install.sh | bash
# download and install Node.js
nvm install 22

# btop
# https://github.com/aristocratos/btop
sudo snap install btop

# Install packages
sudo apt update && sudo apt install -y cloc fd-find git golang-go jq lazygit neovim nmap python3.13-pip python3.13-venv pwgen ripgrep tree

# Lazyvim
# https://www.lazyvim.org
mv ~/.config/nvim{,.bak}
mv ~/.local/share/nvim{,.bak}
mv ~/.local/state/nvim{,.bak}
mv ~/.cache/nvim{,.bak}
git clone https://github.com/LazyVim/starter ~/.config/nvim
rm -rf ~/.config/nvim/.git

# Python - uv
curl -LsSf https://astral.sh/uv/install.sh | sh
# Ruff
uv tool install ruff
# IPython
uv tool install ipython
uv tool update-shell

# Git config
git config --global user.email "angelospanag@protonmail.com"
git config --global user.name "Angelos Panagiotopoulos"
