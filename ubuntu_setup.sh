# Install basic software
sudo apt install -y curl zsh build-essential apt-transport-https vim git keepassxc jq python3-pip python3-venv wireshark nmap pwgen steam software-properties-gtk

# OhMyZsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
bash install.sh

# Node
curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -

# Razer
sudo add-apt-repository ppa:openrazer/stable
sudo add-apt-repository ppa:polychromatic/stable

# Visual Studio Code
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -o root -g root -m 644 packages.microsoft.gpg /etc/apt/trusted.gpg.d/
sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/trusted.gpg.d/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
rm -f packages.microsoft.gpg

# Signal Desktop
wget -O- https://updates.signal.org/desktop/apt/keys.asc | gpg --dearmor > signal-desktop-keyring.gpg
cat signal-desktop-keyring.gpg | sudo tee -a /usr/share/keyrings/signal-desktop-keyring.gpg > /dev/null
echo 'deb [arch=amd64 signed-by=/usr/share/keyrings/signal-desktop-keyring.gpg] https://updates.signal.org/desktop/apt xenial main' |\
  sudo tee -a /etc/apt/sources.list.d/signal-xenial.list

# Wire
wget -q https://wire-app.wire.com/linux/releases.key -O- | sudo apt-key add -
echo "deb [arch=amd64] https://wire-app.wire.com/linux/debian stable main" | sudo tee /etc/apt/sources.list.d/wire-desktop.list

# Brave
sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list

# Install extra software
sudo apt update && sudo apt upgrade -y
sudo apt install -y code signal-desktop wire-desktop nodejs brave-browser openrazer-meta polychromatic
sudo gpasswd -a $USER plugdev

# Snaps
sudo snap install pycharm-professional --classic

# Visual Studio Code extensions
code --install-extension bungcip.better-toml
code --install-extension dbaeumer.vscode-eslint
code --install-extension golang.go
code --install-extension hashicorp.terraform
code --install-extension mechatroner.rainbow-csv
code --install-extension mikestead.dotenv
code --install-extension ms-azuretools.vscode-docker
code --install-extension ms-python.python
code --install-extension ms-python.vscode-pylance
code --install-extension ms-toolsai.jupyter
code --install-extension njpwerner.autodocstring
code --install-extension oderwat.indent-rainbow
code --install-extension PKief.material-icon-theme

VS_CODE_SETTINGS="{\"workbench.colorTheme\": \"Default Dark+\",
        \"workbench.iconTheme\": \"material-icon-theme\",
        \"telemetry.telemetryLevel\": \"off\",
        \"editor.fontSize\": 16,
        \"python.formatting.provider\": \"black\",
        \"python.linting.flake8Enabled\": true,
        \"editor.bracketPairColorization.enabled\": true,
        \"editor.formatOnSave\": true}"

echo $VS_CODE_SETTINGS > ~/.config/Code/User/settings.json

# Python
echo "export PATH=\"\$HOME/.local/bin:\$PATH\"" >> ~/.zshrc
echo "export POETRY_VIRTUALENVS_IN_PROJECT=1" >> ~/.zshrc
source  ~/.zshrc
pip3 install -U --user poetry flake8 pep8-naming black

# Go
wget https://go.dev/dl/go1.17.6.linux-amd64.tar.gz
rm -rf /usr/local/go && tar -C /usr/local -xzf go1.17.6.linux-amd64.tar.gz
sudo rm -rf /usr/local/go && sudo tar -C /usr/local -xzf go1.17.6.linux-amd64.tar.gz
echo "export PATH=\"\$PATH:/usr/local/go/bin" >> ~/.zshrc
rm go1.17.6.linux-amd64.tar.gz

# Git config
git config --global user.email "angelospanag@protonmail.com"
git config --global user.name "Angelos Panagiotopoulos"
git config --global alias.lg "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
git config --global commit.gpgsign true

# Vim config
echo "syntax on" >> ~/.vimrc
echo "set nu" >> ~/.vimrc
echo "colorscheme elflord" >> ~/.vimrc
