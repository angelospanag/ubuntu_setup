# Install basic software
sudo apt install -y curl zsh build-essential apt-transport-https vim git keepassx jq python3-pip wireshark nmap pwgen steam

# OhMyZsh
curl -OL https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh
bash install.sh

# Node
curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -

# Nvidia
sudo add-apt-repository -y ppa:graphics-drivers/ppa

# Spotify
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 0DF731E45CE24F27EEEB1450EFDC8610341D9410 931FF8E79F0876134EDDBDCCA87FF9DF48BF1C90
echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list

# Razer
sudo add-apt-repository -y ppa:openrazer/stable
sudo add-apt-repository -y ppa:polychromatic/stable

# Yarn
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list

# Visual Studio Code
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
sudo mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'

# Signal Desktop
curl -s https://updates.signal.org/desktop/apt/keys.asc | sudo apt-key add -
echo "deb [arch=amd64] https://updates.signal.org/desktop/apt xenial main" | sudo tee -a /etc/apt/sources.list.d/signal-xenial.list

# Wire
wget -q https://wire-app.wire.com/linux/releases.key -O- | sudo apt-key add -
echo "deb [arch=amd64] https://wire-app.wire.com/linux/debian stable main" | sudo tee /etc/apt/sources.list.d/wire-desktop.list

# Install extra software
sudo apt update && sudo apt upgrade -y
sudo apt install -y code openrazer-meta polychromatic signal-desktop wire-desktop nodejs yarn nvidia-driver-418 spotify-client

# Snaps
sudo snap install pycharm-professional slack

# Visual Studio Code extensionswget https://dl.google.com/go/go1.12.5.linux-amd64.tar.gz
tar -C /usr/local -xzf go1.12.5.linux-amd64.tar.gz
echo "export PATH=\$PATH:/usr/local/go/bin" >> ~/.zshrc

code --install-extension CoenraadS.bracket-pair-colorizer
code --install-extension bungcip.better-toml
code --install-extension codezombiech.gitignore
code --install-extension CoenraadS.bracket-pair-colorizer
code --install-extension dbaeumer.vscode-eslint
code --install-extension GrapeCity.gc-excelviewer
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

# Python linting tools
pip3 install --upgrade --user flake8 pep8-naming autopep8

# Go
wget https://dl.google.com/go/go1.12.5.linux-amd64.tar.gz
tar -C /usr/local -xzf go1.12.5.linux-amd64.tar.gz
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
