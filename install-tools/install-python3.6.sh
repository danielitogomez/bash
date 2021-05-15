#!/bin/bash

# This script must be executed as root
# bash script for install python3.6

echo "Installing packages..."

yum update -y && yum groupinstall -y "development tools" && yum install -y lsof wget vim-enhanced words which git curl

### Comment if you want
# Customizing Bash
curl https://raw.githubusercontent.com/linuxacademy/content-python3-sysadmin/master/helpers/bashrc -o ~/.bashrc

# Customizing Vim
curl https://raw.githubusercontent.com/linuxacademy/content-python3-sysadmin/master/helpers/vimrc -o ~/.vimrc

echo "Installinng dependencies..."

yum install -y \
  libffi-devel \
  zlib-devel \
  bzip2-devel \
  openssl-devel \
  ncurses-devel \
  sqlite-devel \
  readline-devel \
  tk-devel \
  gdbm-devel \
  db4-devel \
  libpcap-devel \
  xz-devel \
  expat-devel

echo "Installing Python..."

cd /usr/src
wget http://python.org/ftp/python/3.6.4/Python-3.6.4.tar.xz
tar xf Python-3.6.4.tar.xz
cd Python-3.6.4
./configure --enable-optimizations
make altinstall

python3.6 --version
