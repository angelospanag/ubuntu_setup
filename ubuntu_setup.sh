#!/bin/sh

usage() 
{
  #Printing help message

  echo "Usage: $0 [-d <ubuntu|xubuntu>] [-g <nvidia|bumblebee>] [-h] [-p]

  where:

  -d : Choose setup between Ubuntu and Xubuntu
  -g : Install either vanilla Nvidia drivers or nvidia-bumblebee (Optimus)
  -h : Prints this help message
  -p : Installs Play Framework" 1>&2; exit 1;
}

repositories()
{
  echo "Adding repositories..."

  #Google Chrome and Talk Plugin
  sudo add-apt-repository -y "deb http://dl.google.com/linux/chrome/deb/ stable main"
  sudo add-apt-repository -y "deb http://dl.google.com/linux/talkplugin/deb/ stable main"
  wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -

  #Ubuntu Make
  sudo add-apt-repository -y ppa:ubuntu-desktop/ubuntu-make
  
  #Transmission
  sudo add-apt-repository -y ppa:transmissionbt/ppa
  
  #Pidgin
  sudo add-apt-repository -y ppa:pidgin-developers/ppa

  #LibreOffice
  sudo add-apt-repository -y ppa:libreoffice/ppa

  #WebUpd8 Java 8
  sudo add-apt-repository -y ppa:webupd8team/java
  #Set JAVA_HOME
  echo "JAVA_HOME=/usr/lib/jvm/java-8-oracle" >> $HOME/.pam_environment

  #WebUpd8 Atom
  sudo add-apt-repository -y ppa:webupd8team/atom

  #Spotify
  sudo add-apt-repository -y "deb http://repository.spotify.com stable non-free"
  sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 94558F59

  #Wine
  sudo add-apt-repository -y ppa:ubuntu-wine/ppa
  
  #Xorg-edgers (for latest Nvidia drivers)
  sudo add-apt-repository -y ppa:xorg-edgers/ppa

  #Update repositories
  sudo apt-get update
}

gitsetup()
{
  echo "Setting up git account..."

  #Git setup
  git config --global user.name "Angelos Panagiotopoulos"
  git config --global user.email "angelospanag@gmail.com"
}

#If no arguments are passed, print help and exit
if [ $# -eq 0 ]; then
    usage
    exit
fi

#Main functionality starts here
while getopts ":d:g:hp" option; do
  case $option in
    d)
    s=${OPTARG}
    if [$s=="ubuntu"]
      then
      echo "Installing Ubuntu packages"
      #Click to minimize for Unity launcher (to disable, run the same command with "false" instead of "true")
      gsettings set org.compiz.unityshell:/org/compiz/profiles/unity/plugins/unityshell/ launcher-minimize-window true

      #Add repositories
      repositories

      #Install Ubuntu packages
      sudo apt-get -y install vim ubuntu-restricted-extras p7zip vlc steam pidgin pidgin-otr git guake indicator-multiload compizconfig-settings-manager zenmap wireshark google-chrome-stable google-talkplugin spotify-client oracle-java8-installer atom ubuntu-make

      #Setup git account
      gitsetup
    elif [$s=="xubuntu"]
      then
      echo "Installing Xubuntu packages"
      #Add repositories
      repositories

      #Install Xubuntu packages
      sudo apt-get -y install vim xubuntu-restricted-extras p7zip libreoffice geany vlc steam pidgin-otr git guake zenmap wireshark google-chrome-stable google-talkplugin spotify-client oracle-java8-installer atom ubuntu-make

      #Setup git account
      gitsetup
    else
      usage; exit
    fi
    ;;
    g)
    s=${OPTARG}
    if [$s=="nvidia"]
      then
      echo "Installing Nvidia drivers"
      sudo apt-get -y install nvidia-current
    elif [$s=="bumblebee"]
      then
      echo "Installing Nvidia drivers with bumblebee (laptops with Optimus)"
      sudo apt-get -y install nvidia-current bumblebee-nvidia
    else
      usage; exit
    fi
    ;;
    h)
    usage; exit ;;
    p)
    echo "Downloading and installing Play Framework -- this will probably take a while..."
    #Download Play Framework - activator 1.2.10
    wget -P ${HOME}/Downloads http://downloads.typesafe.com/typesafe-activator/1.2.10/typesafe-activator-1.2.10.zip

    #Extract zip to home folder
    cd Downloads
    unzip typesafe-activator-1.2.10.zip -d ${HOME}

    #Add activator directory to PATH
    echo "PATH DEFAULT=${PATH}:${HOME}/activator-1.2.10" >> $HOME/.pam_environment
    ;;
    \?)
    usage; exit ;;
  esac
done

#Upgrade
echo "Upgrading..."
sudo apt-get -y upgrade
