# Install basic software
sudo apt install -y vim git jq python3-pip python3-venv pipx nmap pwgen

# OhMyBash
# https://github.com/ohmybash/oh-my-bash#basic-installation
bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh)"

# Go
# https://go.dev/doc/install
wget https://go.dev/dl/go1.22.2.linux-amd64.tar.gz
sudo rm -rf /usr/local/go && tar -C /usr/local -xzf go1.22.2.linux-amd64.tar.gz && rm go1.22.2.linux-amd64.tar.gz
echo "export PATH=\"\$PATH:/usr/local/go/bin\"" >> ~/.bashrc

# Node
# https://nodejs.org/en/download/package-manager
# installs NVM (Node Version Manager)
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
# download and install Node.js
nvm install 20

# Python
echo "export POETRY_VIRTUALENVS_IN_PROJECT=1" >> ~/.bashrc
pipx install ipython --python python3
pipx install poetry --python python3
pipx install ruff --python python3
pipx ensurepath
source  ~/.bashrc

# Git config
git config --global user.email "angelospanag@protonmail.com"
git config --global user.name "Angelos Panagiotopoulos"
