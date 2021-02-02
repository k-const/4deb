#!/bin/bash

# configuring package manager
echo 'APT::Get::Install-Recommends "false";' > /etc/apt/apt.conf
echo 'APT::Get::Install-Suggests "false";' > /etc/apt/apt.conf
echo 'deb http://deb.debian.org/debian/ stable main contrib non-free' > /etc/apt/sources.list
echo 'deb http://deb.debian.org/debian/ stable-updates main contrib non-free' >> /etc/apt/sources.list
echo 'deb http://deb.debian.org/debian-security stable/updates main' >> /etc/apt/sources.list
apt update && apt -y upgrade && apt -y install apt-transport-https curl dirmngr wget
echo 'deb https://repo.sparkylinux.org/ core main' > /etc/apt/sources.list.d/sparky.list
wget -O - https://repo.sparkylinux.org/sparky.gpg.key | apt-key add -

# installing desktop environment
apt update && apt -y install nscde-desktop
