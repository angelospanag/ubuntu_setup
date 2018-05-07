# Install basic software
sudo apt install -y kubuntu-restricted-extras curl zsh build-essential vim git xserver-xorg-input-synaptics jq python3-pip golang wireshark nmap pwgen fortune cowsay lolcat sl steam vlc

# OhMyZsh
curl -OL https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh
bash install.sh

# Node
curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash -

# Nvidia
sudo add-apt-repository -y ppa:graphics-drivers/ppa

# Razer
sudo add-apt-repository -y ppa:openrazer/stable
sudo add-apt-repository -y ppa:polychromatic/stable

# Yarn
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list

# Docker
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

# Visual Studio Code
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
sudo mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'

# Signal Desktop
curl -s https://updates.signal.org/desktop/apt/keys.asc | sudo apt-key add -
echo "deb [arch=amd64] https://updates.signal.org/desktop/apt xenial main" | sudo tee -a /etc/apt/sources.list.d/signal-xenial.list

# Install extra software
sudo apt update && sudo apt upgrade -y
sudo apt install -y code docker-ce openrazer-meta polychromatic signal-desktop nodejs yarn nvidia-driver-396

# Visual Studio Code extensions
code --install-extension CoenraadS.bracket-pair-colorizer
code --install-extension PeterJausovec.vscode-docker
code --install-extension bungcip.better-toml
code --install-extension codezombiech.gitignore
code --install-extension coolbear.systemd-unit-file
code --install-extension cstrap.flask-snippets
code --install-extension dbaeumer.vscode-eslint
code --install-extension eg2.vscode-npm-script
code --install-extension lukehoban.Go
code --install-extension mikestead.dotenv
code --install-extension ms-python.python
code --install-extension naereen.makefiles-support-for-vscode
code --install-extension njpwerner.autodocstring
code --install-extension robertohuertasm.vscode-icons
code --install-extension stevejpurves.cucumber

# I have horrible humour
echo "fortune | cowsay -f dragon | lolcat" >> ~/.zshrc

# Python user base directory
echo "export PATH=\$HOME/.local/bin:\"\$PATH\"" >> ~/.zshrc
source  ~/.zshrc

# AWS
pip3 install --upgrade --user awscli 

# Pipenv
pip3 install --upgrade --user pipenv

# Go
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
