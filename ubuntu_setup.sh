# Install basic software
sudo apt install -y curl zsh build-essential apt-transport-https vim git tilix fonts-firacode keepassx jq python3-pip python3-venv wireshark nmap pwgen steam

# OhMyZsh
curl -OL https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh
bash install.sh

# Node
curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -

# Nvidia
sudo add-apt-repository -y ppa:graphics-drivers/ppa

# Razer
sudo add-apt-repository -y ppa:openrazer/stable
sudo add-apt-repository -y ppa:polychromatic/stable

# Spotify
curl -sS https://download.spotify.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list

# Visual Studio Code
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -o root -g root -m 644 packages.microsoft.gpg /usr/share/keyrings/
sudo sh -c 'echo "deb [arch=amd64 signed-by=/usr/share/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'

# Signal Desktop
curl -s https://updates.signal.org/desktop/apt/keys.asc | sudo apt-key add -
echo "deb [arch=amd64] https://updates.signal.org/desktop/apt xenial main" | sudo tee -a /etc/apt/sources.list.d/signal-xenial.list

# Wire
wget -q https://wire-app.wire.com/linux/releases.key -O- | sudo apt-key add -
echo "deb [arch=amd64] https://wire-app.wire.com/linux/debian stable main" | sudo tee /etc/apt/sources.list.d/wire-desktop.list

# Install extra software
sudo apt update && sudo apt upgrade -y
sudo apt install -y code openrazer-meta polychromatic signal-desktop wire-desktop nodejs nvidia-driver-435 spotify-client

# Snaps
sudo snap install pycharm-professional --classic

# Visual Studio Code extensions
code --install-extension bungcip.better-toml
code --install-extension codezombiech.gitignore
code --install-extension CoenraadS.bracket-pair-colorizer
code --install-extension dbaeumer.vscode-eslint
code --install-extension mechatroner.rainbow-csv
code --install-extension mikestead.dotenv
code --install-extension ms-python.python
code --install-extension ms-vscode.Go
code --install-extension naereen.makefiles-support-for-vscode
code --install-extension oderwat.indent-rainbow
code --install-extension PeterJausovec.vscode-docker
code --install-extension vscode-icons-team.vscode-icons

# Python user base directory
echo "export PATH=\$HOME/.local/bin:\"\$PATH\"" >> ~/.zshrc
source  ~/.zshrc

# AWS
pip3 install --upgrade --user awscli 

# Pipenv
pip3 install --upgrade --user pipenv
echo "export PIPENV_VENV_IN_PROJECT=1" >> ~/.zshrc

# Python linting tools
pip3 install --upgrade --user flake8 pep8-naming autopep8

# Go
wget https://dl.google.com/go/go1.13.1.linux-amd64.tar.gz
sudo tar -C /usr/local -xzf go1.13.1.linux-amd64.tar.gz
echo "export PATH=\$PATH:/usr/local/go/bin" >> ~/.zshrc
mkdir -p ~/go/bin
mkdir -p ~/go/src
echo "export GOPATH=~/go" >> ~/.zshrc
echo "export GOBIN=~/go/bin" >> ~/.zshrc
echo "export PATH=\$GOBIN:\"\$PATH\"" >> ~/.zshrc
source  ~/.zshrc
go get -u -v golang.org/x/tools/cmd/goimports
go get -u -v golang.org/x/lint/golint

# Git config
git config --global user.email "angelospanag@gmail.com"
git config --global user.name "Angelos Panagiotopoulos"
git config --global alias.lg "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
git config --global commit.gpgsign true

# Vim config
echo "syntax on" >> ~/.vimrc
echo "set nu" >> ~/.vimrc
echo "colorscheme elflord" >> ~/.vimrc
