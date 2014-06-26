#!/bin/sh

#Google Chrome and Talk Plugin
sudo add-apt-repository -y "deb http://dl.google.com/linux/chrome/deb/ stable main"
sudo add-apt-repository -y "deb http://dl.google.com/linux/talkplugin/deb/ stable main"
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -

#WebUpd8 Java 8
sudo add-apt-repository -y ppa:webupd8team/java
#Set JAVA_HOME
echo "JAVA_HOME=/usr/lib/jvm/java-8-oracle" >> $HOME/.pam_environment

#WebUpd8 Atom
sudo add-apt-repository -y ppa:webupd8team/atom

#Numix theme
sudo add-apt-repository -y ppa:numix/ppa

#Spotify
sudo add-apt-repository -y "deb http://repository.spotify.com stable non-free"
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 94558F59

#Wine
sudo add-apt-repository -y ppa:ubuntu-wine/ppa

#Update and upgrade
sudo apt-get update && sudo apt-get -y upgrade

#Install my packages
sudo apt-get -y install ubuntu-restricted-extras p7zip unity-tweak-tool vlc steam pidgin pidgin-otr git guake indicator-multiload compizconfig-settings-manager zenmap wireshark google-chrome-stable google-talkplugin spotify-client oracle-java8-installer atom numix-gtk-theme numix-icon-theme-circle numix-wallpaper-aurora

#Git setup
git config --global user.name "Angelos Panagiotopoulos"
git config --global user.email "angelospanag@gmail.com"

#Eclipse menus don't show fix
echo "[Desktop Entry]" >> /usr/share/applications/eclipse.desktop
echo "Type=Application" >> /usr/share/applications/eclipse.desktop
echo "Name=Eclipse" >> /usr/share/applications/eclipse.desktop
echo "Icon=eclipse" >> /usr/share/applications/eclipse.desktop
echo "Exec=env UBUNTU_MENUPROXY= eclipse" >> /usr/share/applications/eclipse.desktop
echo "Terminal=false" >> /usr/share/applications/eclipse.desktop
echo "Categories=Development;IDE;Java;" >> /usr/share/applications/eclipse.desktop

#Warning!!! Uncomment this only if you have installed Play with activator
#Play Framework - activator 1.2.2
#echo "PATH DEFAULT=${PATH}:${HOME}/activator-1.2.2" >> $HOME/.pam_environment
