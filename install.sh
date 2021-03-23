#!/bin/bash

# configuring package manager
echo 'APT::Get::Install-Recommends "false";' > /etc/apt/apt.conf
echo 'APT::Get::Install-Suggests "false";' >> /etc/apt/apt.conf
echo 'deb http://deb.debian.org/debian/ stable main contrib non-free' > /etc/apt/sources.list
echo 'deb http://deb.debian.org/debian/ stable-updates main contrib non-free' >> /etc/apt/sources.list
echo 'deb http://deb.debian.org/debian-security stable/updates main' >> /etc/apt/sources.list
apt update && apt -y upgrade && apt -y install apt-transport-https curl dirmngr flatpak wget

# installing desktop environment and some necessary apps
apt -y install at-spi2-core audacity chrome-gnome-shell clementine cups-filters-core-drivers \
cutecom doublecmd-gtk doublecmd-plugins file-roller filezilla firefox-esr firefox-esr-l10n-ru \
fonts-ibm-plex fonts-noto-cjk-extra gdm3 gimp gimp-data-extras gimp-dds gimp-gap gimp-gmic \
gimp-gutenprint gimp-lensfun gimp-plugin-registry gimp-ufraw gtkam-gimp gnome-session \
gnome-session-canberra gnome-sushi gnome-terminal gnome-tweaks gnome-user-docs gstreamer1.0-gtk3 \
htop iptables-persistent libreoffice-calc libglx-mesa0 libreoffice-gnome libreoffice-gtk3 \
libreoffice-impress libreoffice-l10n-ru libreoffice-writer macchanger mactelnet-client mpv mtr \
nautilus-admin nautilus-extension-gnome-terminal nautilus-sendto nautilus-share nautilus-wipe \
network-manager-l2tp-gnome network-manager-openconnect-gnome network-manager-openvpn-gnome \
network-manager-pptp-gnome network-manager-ssh-gnome network-manager-strongswan pavucontrol \
printer-driver-all printer-driver-cups-pdf pwgen qbittorrent qpdfview qpdfview-djvu-plugin \
qpdfview-ps-plugin qt5-style-plugins rar screengrab sipcalc speedcrunch tcpdump thunderbird \
thunderbird-l10n-ru ttf-mscorefonts-installer ttf-unifont unace unrar unzip vim-gtk3 wireshark-gtk \
xdg-utils xserver-xorg xserver-xorg-input-libinput xserver-xorg-video-ati xserver-xorg-video-vesa zip
