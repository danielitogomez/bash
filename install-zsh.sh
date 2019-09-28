#!/bin/bash

if [ -z "$(rpm -qa | grep zsh)" ]; then
     if [ $(cat /etc/redhat-release | awk '{print $1}') = CentOS ] || [ $(cat /etc/redhat-release | awk '{print $1}') = Fedora ]; then
        yum update -y
        yum install zsh -y && chsh -s /bin/zsh root
                echo $SHELL
        yum install wget git && wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh
        cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc && source ~/.zshrc
                echo "You can now use zsh"
        else
                echo "This script only works for CentOs or Fedora operating system"
      fi
  else
                echo "You already had zsh installed"
fi
