#!/bin/bash

# configuring package manager
echo 'APT::Get::Install-Recommends "false";' > /etc/apt/apt.conf
echo 'APT::Get::Install-Suggests "false";' >> /etc/apt/apt.conf
echo 'deb http://deb.debian.org/debian/ stable main contrib non-free' > /etc/apt/sources.list
echo 'deb http://deb.debian.org/debian/ stable-updates main contrib non-free' >> /etc/apt/sources.list
echo 'deb http://deb.debian.org/debian-security stable/updates main' >> /etc/apt/sources.list
apt update && apt -y upgrade && apt -y install apt-transport-https curl dirmngr wget
echo 'deb https://repo.sparkylinux.org/ core main' > /etc/apt/sources.list.d/sparky.list
wget -O - https://repo.sparkylinux.org/sparky.gpg.key | apt-key add -

# installing desktop environment and some necessary apps
apt update && apt -y install chromium dbus-x11 doublecmd-gtk doublecmd-plugins libsmbclient \
nscde-desktop pavucontrol slim system-config-printer tilix tor vim-gtk3 wine xinit
echo $'#!/bin/sh \nexec dbus-launch nscde' > /home/$SUDO_USER/.xinitrc
chown $SUDO_USER:$SUDO_USER /home/$USER/.xinitrc

# installing drivers
apt -y install bluez-firmware firmware-amd-graphics firmware-atheros firmware-bnx2* firmware-iwlwifi \
firmware-libertas firmware-linux firmware-linux-nonfree firmware-ralink firmware-realtek \
xserver-xorg-input-libinput
echo 'Does your PC have a touchpad? [Y/n]
read touchpad
case doing $touchpad in
  Y | y | u | Yes | yes ) apt -y install xserver-xorg-input-synaptics
  ;;
  N | n | No | no ) exit 0
  ;;
  * ) exit 0 && echo "Abort."
  ;;
esac

