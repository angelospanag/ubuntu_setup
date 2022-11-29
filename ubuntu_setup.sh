# Install basic software
sudo apt install -y curl zsh build-essential apt-transport-https wget gpg vim git keepassxc jq python3-pip python3-venv wireshark nmap pwgen steam software-properties-gtk

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
sudo install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings
sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
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
code --install-extension bradlc.vscode-tailwindcss
code --install-extension charliermarsh.ruff
code --install-extension esbenp.prettier-vscode
code --install-extension golang.go
code --install-extension hashicorp.terraform
code --install-extension mechatroner.rainbow-csv
code --install-extension mikestead.dotenv
code --install-extension ms-azuretools.vscode-docker
code --install-extension ms-python.black-formatter
code --install-extension ms-python.isort
code --install-extension ms-python.python
code --install-extension ms-python.vscode-pylance
code --install-extension ms-toolsai.jupyter
code --install-extension ms-toolsai.jupyter-keymap
code --install-extension ms-toolsai.jupyter-renderers
code --install-extension ms-toolsai.vscode-jupyter-cell-tags
code --install-extension ms-toolsai.vscode-jupyter-slideshow
code --install-extension njpwerner.autodocstring
code --install-extension oderwat.indent-rainbow
code --install-extension PKief.material-icon-theme
code --install-extension rust-lang.rust-analyzer
code --install-extension tamasfe.even-better-toml
code --install-extension yzhang.markdown-all-in-one

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
pip3 install -U --user poetry flake8 flake8-bugbear pep8-naming black ipython

# Go
wget https://go.dev/dl/go1.19.3.linux-amd64.tar.gz
sudo rm -rf /usr/local/go && sudo tar -C /usr/local -xzf go1.19.3.linux-amd64.tar.gz
echo "export PATH=\"\$PATH:/usr/local/go/bin" >> ~/.zshrc
rm go1.19.3.linux-amd64.tar.gz

# Git config
git config --global user.email "angelospanag@protonmail.com"
git config --global user.name "Angelos Panagiotopoulos"
git config --global alias.lg "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
git config --global commit.gpgsign true

# Vim config
echo "syntax on" >> ~/.vimrc
echo "set nu" >> ~/.vimrc
echo "colorscheme elflord" >> ~/.vimrc
