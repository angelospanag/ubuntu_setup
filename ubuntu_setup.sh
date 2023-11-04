# Install basic software
sudo apt install -y curl ca-certificates gnupg zsh build-essential apt-transport-https wget gpg vim git keepassxc jq python3-pip python3-venv pipx wireshark nmap pwgen steam

# OhMyBash
# https://github.com/ohmybash/oh-my-bash#basic-installation
bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh)"

# Python
# https://launchpad.net/%7Edeadsnakes/+archive/ubuntu/ppa
sudo add-apt-repository ppa:deadsnakes/ppa

# Java
# https://adoptium.net/en-GB/installation/linux/#_deb_installation_on_debian_or_ubuntu
mkdir -p /etc/apt/keyrings
wget -O - https://packages.adoptium.net/artifactory/api/gpg/key/public | tee /etc/apt/keyrings/adoptium.asc
echo "deb [signed-by=/etc/apt/keyrings/adoptium.asc] https://packages.adoptium.net/artifactory/deb $(awk -F= '/^VERSION_CODENAME/{print$2}' /etc/os-release) main" | tee /etc/apt/sources.list.d/adoptium.list

# Go
# https://github.com/golang/go/wiki/Ubuntu#using-ppa
sudo add-apt-repository ppa:longsleep/golang-backports

# Node
# https://github.com/nodesource/distributions#installation-instructions
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | sudo gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg
NODE_MAJOR=20
echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_$NODE_MAJOR.x nodistro main" | sudo tee /etc/apt/sources.list.d/nodesource.list

# Razer
sudo add-apt-repository ppa:openrazer/stable
sudo add-apt-repository ppa:polychromatic/stable

# Visual Studio Code
# https://code.visualstudio.com/docs/setup/linux#_debian-and-ubuntu-based-distributions
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg
sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
rm -f packages.microsoft.gpg

# Signal Desktop
# https://www.signal.org/download/linux/
wget -O- https://updates.signal.org/desktop/apt/keys.asc | gpg --dearmor > signal-desktop-keyring.gpg
cat signal-desktop-keyring.gpg | sudo tee /usr/share/keyrings/signal-desktop-keyring.gpg > /dev/null
echo 'deb [arch=amd64 signed-by=/usr/share/keyrings/signal-desktop-keyring.gpg] https://updates.signal.org/desktop/apt xenial main' | sudo tee /etc/apt/sources.list.d/signal-xenial.list

# Wire
# https://github.com/wireapp/wire-desktop/wiki/How-to-install-Wire-for-Desktop-on-Linux#installation-on-debian-based-distributions
wget -q https://wire-app.wire.com/linux/releases.key -O- | sudo apt-key add -
 echo "deb [arch=amd64] https://wire-app.wire.com/linux/debian stable main" | sudo tee /etc/apt/sources.list.d/wire-desktop.list

# Install extra software
sudo apt update && sudo apt upgrade -y
sudo apt install -y python3.12 code signal-desktop wire-desktop golang-go nodejs temurin-21-jdk openrazer-meta polychromatic
sudo gpasswd -a $USER plugdev

# Snaps
sudo snap install pycharm-professional --classic

# Visual Studio Code extensions
code --install-extension charliermarsh.ruff
code --install-extension dbaeumer.vscode-eslint
code --install-extension esbenp.prettier-vscode
code --install-extension golang.go
code --install-extension ms-azuretools.vscode-docker
code --install-extension ms-python.python
code --install-extension ms-python.vscode-pylance
code --install-extension pflannery.vscode-versionlens
code --install-extension tamasfe.even-better-toml
code --install-extension unifiedjs.vscode-mdx
code --install-extension yzhang.markdown-all-in-one

VS_CODE_SETTINGS="{\"workbench.colorTheme\": \"Default Dark+\",
        \"workbench.iconTheme\": \"material-icon-theme\",
        \"telemetry.telemetryLevel\": \"off\",
        \"editor.fontSize\": 16,
        \"editor.bracketPairColorization.enabled\": true,
        \"editor.formatOnSave\": true}"

echo $VS_CODE_SETTINGS > ~/.config/Code/User/settings.json

# Python
echo "export POETRY_VIRTUALENVS_IN_PROJECT=1" >> ~/.bashrc
pipx install ipython --python python3.12
pipx install poetry --python python3.12
pipx install ruff --python python3.12
source  ~/.bashrc

# Git config
git config --global user.email "angelospanag@protonmail.com"
git config --global user.name "Angelos Panagiotopoulos"
git config --global alias.lg "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
git config --global commit.gpgsign true

# Vim config
echo "syntax on" >> ~/.vimrc
echo "set nu" >> ~/.vimrc
echo "colorscheme elflord" >> ~/.vimrc
