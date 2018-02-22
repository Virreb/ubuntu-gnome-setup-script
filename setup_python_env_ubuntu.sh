#!/bin/bash
# In order to run this file, use chmod +x <filename>, then ./<filename>

while getopts "rop" opt; do
  case $opt in
    r)
      echo "Installing required packages"
      # Update system
      sudo apt-get -y update
      sudo apt-get -y upgrade
 
      # Get some goodies
      sudo apt-get -y install git
      sudo apt-get -y install htop
      sudo apt-get -y install alien

      # Install python3.6 and package manger
      sudo apt-get -y install python3.6
      sudo apt-get -y install python-pip
      python -m pip install --upgrade pip setuptools wheel  # python package installer

      # Install common third party packages for python dev
      sudo apt-get -y install python-dev	
      sudo apt-get -y install python3-dev
      sudo apt-get -y install libevent-dev
      sudo apt-get -y install virtualenv
      sudo apt-get -y install build-essential
      sudo apt-get -y install libaio1

      # Install ssh
      sudo apt-get -y install openssh-server openssh-client
      ;;
    o)
      echo "Installing optional packages"
      # Install terminal
      sudo apt-get -y install fish

      # Install editors
      sudo apt-get -y install vim
      sudo apt-get -y install emacs
      
      
      # Install pycharm
      sudo snap install pycharm-community --classic

      # Install latest firefox
      sudo add-apt-repository -y ppa:ubuntu-mozilla-daily/ppa
      sudo apt-get update
      sudo apt-get install firefox-trunk
      ;;
    p)
      # Create a Projects folder
      if [ ! -d "~/Projects" ]; then
        mkdir ~/Projects
      fi
      
      # Get Gnome-desktop
      sudo apt-get -y install gnome-session
      sudo update-alternatives --config gdm3.css
      
      # Install stuff for gnome shell
      sudo apt-get -y install gnome-session
      sudo apt-get -y install gnome-shell-extensions
      sudo apt-get -y install chrome-gnome-shell
      sudo apt-get -y install gnome-tweak-tool
      sudo apt-get -y install xdotool

      # Disable screen saver
      gsettings set org.gnome.desktop.screensaver lock-enabled false  # disable screen lock
      gsettings set org.gnome.desktop.session idle-delay 0  # disable screen blackout

      # Print out some nice to have extensions, easilly installed through gnome shell website
      echo "If you want some nice Gnome extensions, check out 'Hide top panel', 'No Title bar', 	   'Undecorate window', 'gTile' and 'gnomeTweaks' from the gnome extensions website." 
      ;;
    \?)
      echo "Invalid option: -$OPTARG use either -r for required, -o for optional or -p for specific modules" >&2
      exit 1
      ;;
  esac
done

