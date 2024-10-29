# Upgrade current packages
sudo apt update && sudo apt upgrade -y

# OhMyBash
# https://github.com/ohmybash/oh-my-bash#basic-installation
bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh)"

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

# Install packages
sudo apt update && sudo apt install -y vim git jq python3.13-pip python3.13-venv nmap pwgen golang-go

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
