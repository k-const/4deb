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

# installing desktop environment
apt update && apt -y install chromium doublecmd-plugins evolution gpicview guake libsmbclient lxtask \
mpv nscde-desktop pavucontrol slim system-config-printer tor vim-gtk3 wine xinit

# installing drivers
apt -y install bluez-firmware firmware-atheros firmware-bnx2* firmware-iwlwifi firmware-libertas \
firmware-linux firmware-linux-nonfree firmware-ralink firmware-realtek
echo 'Please select vendor of your graphics card [1-4] (open-source graphics device driver will be installed)"
echo "1. AMD/ATI"
echo "2. NVIDIA"
echo "3. Intel"
echo "4. Other (use default vesa driver)"
read graphics
case doing $graphics in
  1 ) apt -y install xserver-xorg-video-ati
  ;;
  2 ) apt -y install xserver-xorg-video-nouveau
  ;;
  3 ) apt -y install xserver-xorg-video-intel
  ;;
  4 ) apt -y install xserver-xorg-video-vesa
  ;;
  * ) echo "Abort."
  ;;
esac
